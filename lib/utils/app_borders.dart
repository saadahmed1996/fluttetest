import 'package:flutter/material.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_size.dart';

class AppBorders {
  static OutlineInputBorder outLineInputBorder(
      {Color? borderColor, bool? isBorder = true, double? radius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? AppSize.radius),
      borderSide: BorderSide(
        width: 1.5,
        color: borderColor ?? AppColors.kPrimaryColor,
        style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
      ),
    );
  }

  static OutlineInputBorder outLineInputErrorBorder(
      {bool? isBorder = true, double? radius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? AppSize.radius),
      borderSide: BorderSide(
        width: 1.5,
        color: AppColors.redColor,
        style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
      ),
    );
  }
}
