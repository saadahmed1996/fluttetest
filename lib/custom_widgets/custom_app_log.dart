import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/utils/assets_path.dart';

class CustomAppLogo extends StatelessWidget {
  final double? scale;
  final bool isSplash;
  final double? leftPadding, rightPadding, topPadding, bottomPadding;
  const CustomAppLogo({
    Key? key,
    this.scale,
    this.isSplash = false,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? (isSplash ? 0 : 20.h),
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
        bottom: bottomPadding ?? (isSplash ? 0 : 0.h),
      ),
      child: Center(
        child: Image.asset(
          AssetPaths.app_logo,
          // height: 180.h,
          scale: 3.5.sp,
        ),
      ),
    );
  }
}
