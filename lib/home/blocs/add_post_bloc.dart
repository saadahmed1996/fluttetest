import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/home/controller/home_controller.dart';
import 'package:flutter_test_project/home/models/generic_post_model.dart';
import 'package:flutter_test_project/services/app_logger.dart';
import 'package:flutter_test_project/services/network.dart';
import 'package:flutter_test_project/splash/controller/global_controller.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_network_strings.dart';

class AddPostBloc {
  Map<String, dynamic>? _formDataMap;
  Response? _response;
  VoidCallback? _onSuccess, _onFailure;
  String? deviceToken;

  void addPostBlocMethod({
    required BuildContext context,
    String? title,
    String? body,
    required VoidCallback setProgressBar,
  }) async {
    setProgressBar();

    _formDataMap = {
      "title": title ?? "123",
      "body": body ?? "",
      "userId": 5,
    };

    print({
      "title": title ?? "123",
      "body": body ?? "",
      "userId": 5,
    });

    _onFailure = () {
      AppNavigation.navigatorPop(context);
    };

    _response = await Network().postRequestRawData(
      context: context,
      body: _formDataMap,
      endPoint: NetworkStrings.POST_ADD_ENDPOINT,
      onFailure: _onFailure,
      isHeaderRequire: false,
    );

    _onSuccess = () {
      AppNavigation.navigatorPop(context);
      _profileResponseMethod(context: context);
    };
    _validateResponse();
  }

  //-------------------------- Validate Response --------------------------
  void _validateResponse() {
    if (_response != null) {
      Network().validateResponse(
        isToast: false,
        response: _response,
        onSuccess: _onSuccess,
        onFailure: _onFailure,
      );
    }
  }

  // void _profileResponseMethod({
  //   required BuildContext context,
  // }) async {
  //   try {
  //     logData(message: "message: ${_response?.data}");

  //     Post value = Post.fromJson(_response!.data);
  //     if (_response?.data != null) {
  //       AppDialogs.showToast(message: "Post Added Successfully");
  //       HomeController.i.categoryRecentData.value?.posts?.add(value);
  //     }
  //   } catch (error) {
  //     AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
  //   }
  // }

  void _profileResponseMethod({
    required BuildContext context,
  }) async {
    try {
      // Manually creating a new Post object with given data
      // final newPost = Post(
      //   id: 252,
      //   title: "123",
      //   userId: 5,
      // );

      final newPost = Post.fromJson(_response?.data);

      // Check if the response contains data
      if (_response?.data != null) {
        AppDialogs.showToast(message: "Post Added Successfully");

        // Add the new post to the beginning of the list
        final posts = HomeController.i.categoryRecentData.value?.posts;

        if (posts != null) {
          // Insert the new post at the beginning of the list (reverse order)
          posts.insert(0, newPost);

          // Update the HomeController with the new list
          HomeController.i.categoryRecentData.value?.posts = posts;
          HomeController.i.update();
        }
      }
    } catch (error) {
      AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
    }
  }
}
