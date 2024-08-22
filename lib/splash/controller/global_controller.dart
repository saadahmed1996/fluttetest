// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_test_project/auth/models/user_model.dart';
import 'package:flutter_test_project/services/app_logger.dart';
import 'package:flutter_test_project/services/local_storage.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  Rxn<UserModel> currentUser = Rxn(null);

  void updateGetx({required UserModel? current}) {
    currentUser.value = current;
    update();
  }

  Future<void> initShared() async {
    await SharedPreference().sharedPreference;
  }

  Future<void> loadCurrentUserFromSharedPreference(
      {required BuildContext context}) async {
    final userJson = await SharedPreference().getUser();
    if (userJson != null) {
      logData(message: "userJson: ${userJson.toJson()}");
      if (userJson != null) {
        currentUser.value = userJson;
        logData(message: "currentUser: ${currentUser.value?.displayName}");
        AppNavigation.navigateToRemovingAll(
            context, AppRouteName.HOME_SCREEN_ROUTE);
      } else {
        AppNavigation.navigateToRemovingAll(
            context, AppRouteName.LOGIN_SCREEN_ROUTE);
      }
    } else {
      //! ============> if userJson not saved or is null then navigate it to the login screen
      AppNavigation.navigateToRemovingAll(
          context, AppRouteName.LOGIN_SCREEN_ROUTE);
    }
  }
}
