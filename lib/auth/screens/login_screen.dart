import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/auth/controller/auth_controller.dart';
import 'package:flutter_test_project/custom_widgets/custom_auth_container_widget.dart';
import 'package:flutter_test_project/custom_widgets/custom_button.dart';
import 'package:flutter_test_project/services/firebase_login_bloc.dart';
import 'package:flutter_test_project/utils/app_colors.dart';
import 'package:flutter_test_project/utils/app_dialogs.dart';
import 'package:flutter_test_project/utils/app_fonts.dart';
import 'package:flutter_test_project/utils/assets_path.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: CustomFormContainerWidget(
        screenText: "",
        isLogoScreen: true,
        child: _preLoginWidget(context),
      ),
    );
  }

  Widget _preLoginWidget(BuildContext context) {
    return Expanded(
      child: _loginOptionsWidget(context),
    );
  }

  Widget _loginOptionsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Form(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Gmail
                    CustomButton(
                      borderColor: Colors.transparent,
                      buttonColor: AppColors.redColor,
                      onTap: () {
                        FirebaseAuthBloc().signInWithGoogle(
                          context: context,
                          isLogin: true,
                        );
                      },
                      buttonText: "Signin With Google",
                      icon: AssetPaths.gmail_icon,
                      containsIcon: true,
                    ),
                    10.verticalSpace,
                    //Apple
                    // Platform.isIOS
                    //     ?
                    CustomButton(
                      borderColor: Colors.transparent,
                      buttonColor: AppColors.kPrimaryColor,
                      onTap: () {
                        AppDialogs.showToast(
                            message: "I have not implemented yet");
                      },
                      buttonText: "Signin With Apple",
                      textColor: AppColors.whiteColor,
                      icon: AssetPaths.apple_icon,
                      containsIcon: true,
                    )
                    // : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            _termsAndprivacyNavigationWidget(context),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _termsAndprivacyNavigationWidget(BuildContext context) {
    TextStyle linkStyle = TextStyle(
      color: AppColors.kPrimaryColor,
      decoration: TextDecoration.underline,
      fontSize: 16,
      fontFamily: AppFonts.robotoBold,
    );
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              height: 1.6,
              color: AppColors.blackColor,
              fontFamily: AppFonts.robotoRegular,
            ),
            children: <TextSpan>[
              const TextSpan(
                // text: AppStrings.bySigningIn,
                text: "By Sign-in, You agree to our ",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: AppFonts.robotoRegular,
                ),
              ),
              TextSpan(
                // text: AppStrings.termsAndCondition,
                text: "Terms & Conditions",
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // AppNavigation.navigateTo(
                    //   context,
                    //   AppRouteName.CONTENT_ROUTING_SCREEN,
                    //   arguments: ContentRoutingArgument(
                    //     title: tr("Terms & Conditions"),
                    //     contentType: 'tc',
                    //   ),
                    // );
                  },
              ),
              const TextSpan(
                text: " & ",
              ),
              TextSpan(
                // text: AppStrings.privacyPolicy,
                text: "Privacy Policy",
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // AppNavigation.navigateTo(
                    //   context,
                    //   AppRouteName.CONTENT_ROUTING_SCREEN,
                    //   arguments: ContentRoutingArgument(
                    //     // title: "Privacy Policy",
                    //     title: tr("Privacy Policy"),
                    //     contentType: 'pp',
                    //   ),
                    // );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
