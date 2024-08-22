import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/custom_widgets/custom_text.dart';
import 'package:flutter_test_project/splash/controller/global_controller.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_fonts.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
import 'package:flutter_test_project/utils/assets_path.dart';
import 'package:flutter_test_project/utils/screen_size.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer splashTimer;

  var globalC = GlobalController.i;

  @override
  void initState() {
    splashTimer = Timer(
      const Duration(seconds: 3),
      () {
        globalC.loadCurrentUserFromSharedPreference(context: Get.context!);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    splashTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    ScreenSize.screenSizeMethod(context: context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetPaths.app_logo,
              scale: 3.8.sp,
            ),
            10.verticalSpace,
            CustomText(
              text: "Flutter Test",
              color: AppColors.kPrimaryColor,
              isLeftAlign: false,
              fontFamily: AppFonts.robotoBlack,
              fontsize: 30.sp,
            )
          ],
        ),
      ),
    );
  }
}
