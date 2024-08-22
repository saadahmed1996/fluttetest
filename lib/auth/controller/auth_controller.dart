import 'package:flutter/material.dart';
import 'package:flutter_test_project/services/app_logger.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
import 'package:flutter_test_project/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController get i => Get.find();

  Future<void> saveUserDataLocally(
      {required String email,
      required String token,
      required BuildContext context}) async {
    logData(message: "saveUserDataLocally:");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (email != null && token != null) {
      await prefs.setString(AppStrings.CURRENT_USER_EMAIL_KEY, email);
      await prefs.setString(AppStrings.BEARER_TOKEN_KEY, token);
      AppNavigation.navigateToRemovingAll(
        context,
        AppRouteName.HOME_SCREEN_ROUTE,
      );
    } else {
      AppDialogs.showToast(message: "Something went wrong");
    }
  }
}
