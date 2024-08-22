import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/custom_widgets/custom_app_log.dart';
import 'package:flutter_test_project/custom_widgets/custom_text.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_fonts.dart';

class CustomFormContainerWidget extends StatelessWidget {
  final Widget? child;
  final bool? isLogoScreen;
  final bool? isButtonIconVisible;
  final String? screenText;
  final String? subScreenText;
  final String? bgImage;
  final Function()? onTapLeading;
  final bool? isSpacer;

  const CustomFormContainerWidget(
      {Key? key,
      this.screenText,
      this.subScreenText,
      this.isButtonIconVisible,
      this.bgImage,
      this.onTapLeading,
      this.child,
      this.isSpacer,
      this.isLogoScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLogoScreen == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              100.verticalSpace,
              _logo(),
              CustomText(
                text: screenText ?? "",
                color: AppColors.whiteColor,
                fontsize: 32.sp,
                fontFamily: AppFonts.robotoRegular,
                isLeftAlign: false,
              ),
              5.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: CustomText(
                  text: subScreenText ?? "",
                  color: AppColors.whiteColor,
                  fontsize: 15.sp,
                  fontFamily: AppFonts.robotoRegular,
                  isLeftAlign: false,
                ),
              ),
              20.verticalSpace,
              child!,
            ],
          )
        : child!;
  }

  Widget _logo() => const CustomAppLogo();
}
