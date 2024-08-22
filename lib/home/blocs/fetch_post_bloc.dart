import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/home/controller/home_controller.dart';
import 'package:flutter_test_project/home/models/generic_post_model.dart';
import 'package:flutter_test_project/services/app_logger.dart';
import 'package:flutter_test_project/services/network.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_network_strings.dart';

class FetchPostBloc {
  Map<String, dynamic>? _queryParameters;
  Response? _response;
  VoidCallback? _onSuccess, _onFailure;
  int _currentPage = 1; // Initialize current page
  final int _postsPerPage = 10;
  bool _hasMorePosts = true;

  Future fetchPostBlocMethod({
    required BuildContext context,
    required VoidCallback setProgressBar,
    required int currentPage, // Accept currentPage as parameter
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      _currentPage = 1; // Reset page number for refresh
      _hasMorePosts = true; // Allow fetching more posts
    } else {
      _currentPage = currentPage; // Set currentPage for pagination
    }

    if (!_hasMorePosts) return;

    setProgressBar();

    _queryParameters = {
      'skip': _currentPage,
      'limit': _postsPerPage,
    };

    _onFailure = () {
      AppNavigation.navigatorPop(context);
    };

    await _getRequest(
      endPoint: NetworkStrings.POST_ENDPOINT,
      context: context,
    );

    _onSuccess = () {
      AppNavigation.navigatorPop(context);
      _responseMethod(context: context, isRefresh: isRefresh);
    };

    _validateResponse();

    return _response;
  }

  Future<void> _getRequest({
    required String endPoint,
    required BuildContext context,
  }) async {
    _response = await Network().getRequest(
      context: context,
      endPoint: endPoint,
      queryParameters: _queryParameters,
      onFailure: () => AppNavigation.navigatorPop(context),
      isToast: false,
      isHeaderRequire: false,
    );
  }

  void _validateResponse() {
    if (_response != null) {
      Network().validateResponse(
        response: _response,
        onSuccess: _onSuccess,
        onFailure: _onFailure,
        isToast: false,
      );
    }
  }

  void _responseMethod(
      {required BuildContext context, bool isRefresh = false}) {
    try {
      if (_response?.data != null) {
        List<dynamic> postsData = _response?.data['posts'] ?? [];
        _hasMorePosts = postsData.length ==
            _postsPerPage; // Check if more data is available

        List<Post> posts =
            postsData.map((post) => Post.fromJson(post)).toList();
        final currentData = HomeController.i.categoryRecentData.value ??
            GenericPostModel(posts: []);

        if (isRefresh) {
          currentData.posts = posts; // Replace existing posts with new data
        } else {
          currentData.posts?.addAll(posts); // Append new data to existing posts
        }

        HomeController.i.categoryRecentData.value = currentData;
        HomeController.i.update();

        if (!isRefresh) {
          _currentPage++; // Increment page number for subsequent loads
        }
      } else {
        logData(message: "No data found in the response");
      }
    } catch (error) {
      AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
      logData(message: "Error occurred: $error");
    }
  }
}
