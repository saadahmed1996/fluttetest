import 'package:flutter/material.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppDialogs {
  //! ============> Flutter Custom Toast
  static void showToast({
    String? message,
    Toast? toastLength,
    int? timeInSecForIosWeb,
  }) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: timeInSecForIosWeb ?? 1,
    );
  }

  static Widget circularProgressWidget({Color? color}) {
    return CircularProgressIndicator(
      color: color ?? AppColors.kPrimaryColor,
    );
  }

  //! ============> Spinkit for API call
  static void progressAlertDialog(
      {required BuildContext context, Color? color}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.blackColor.withOpacity(0.5),
              color: color ?? AppColors.kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
