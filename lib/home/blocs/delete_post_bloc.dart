import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/home/controller/home_controller.dart';
import 'package:flutter_test_project/services/network.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_network_strings.dart';

class DeletePostBloc {
  Response? _response;
  VoidCallback? _onSuccess, _onFailure;

  Future deletePostBlocMethod({
    required BuildContext context,
    required VoidCallback setProgressBar,
    required String postId,
  }) async {
    setProgressBar();

    _onFailure = () {
      AppNavigation.navigatorPop(context);
    };

    _response = await Network().deleteRequest(
      endPoint: NetworkStrings.POST_DELETE_ENDPOINT + postId,
      context: context,
      onFailure: _onFailure,
      isHeaderRequire: false,
    );

    _onSuccess = () {
      AppNavigation.navigatorPop(context);
      _accountDeleteResponseMethod(
        context: context,
        postId: postId,
      );
    };

    _validateResponse();
  }

  /// Validate Response
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

  void _accountDeleteResponseMethod({
    required BuildContext context,
    required String postId,
  }) {
    try {
      HomeController.i.categoryRecentData.value?.posts?.removeWhere(
          (element) => element.id.toString() == postId.toString());
      HomeController.i.update();
      AppDialogs.showToast(message: "Post Deleted Successfully");
    } catch (error) {
      AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
    }
  }
}
