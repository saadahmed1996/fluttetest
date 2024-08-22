import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/splash/controller/global_controller.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_fonts.dart';
import 'package:flutter_test_project/utils/app_routes.dart';
import 'package:flutter_test_project/utils/app_size.dart';
import 'package:flutter_test_project/utils/app_strings.dart';
import 'package:flutter_test_project/utils/constants.dart';
import 'package:flutter_test_project/utils/dismiss_keyboard.dart';
import 'package:get/get.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext mainContext) {
    return ScreenUtilInit(
      designSize: const Size(AppSize.fullScreenWidth, AppSize.fullScreenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (screenUtilContext, child) {
        return GetBuilder<GlobalController>(
          init: GlobalController(),
          builder: (splashContext) {
            return GetMaterialApp(
              navigatorKey: Constants.navigatorKey,
              navigatorObservers: [
                KeyboardDismissalNavigatorObserver(),
              ],
              scrollBehavior:
                  const ScrollBehavior().copyWith(overscroll: false),
              title: AppStrings.appTitle,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: AppColors.kPrimaryColor,
                scaffoldBackgroundColor: AppColors.transparentColor,
                fontFamily: AppFonts.robotoRegular,
                splashColor: AppColors.transparentColor,
                highlightColor: AppColors.transparentColor,
              ),
              debugShowCheckedModeBanner: false,
              getPages: AppRouter.routes,
              // builder: EasyLoading.init(),
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.0),
                  ),
                  child: widget!,
                );
              },
            );
          },
        );
      },
    );
  }
}
