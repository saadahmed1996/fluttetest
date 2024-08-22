import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  static double widthSize = 0.0;
  static double heightSize = 0.0;
  static const double fullScreenHeight = 812;
  static const double fullScreenWidth = 375;
  static double authContainerHeight = 0.7.sh;
  static double logoHeight = 0.3.sh;
  static double appLogoScale = 3.5;
  static double allRoundBorder = 30;
  static const double circularImageHeigh = 130;
  static const double circularImageWidht = 130;
  static double headingFontSize = 18.sp;
  //commented by shumaila
  // static const double radius=16.0;
  static const double radius = 8.0;
  static double notchBottomPadding = 20.h;
  static double buttonTopPadding = 8.h;

  static double sketchContainerHeight = 300.h;

  static const double NINETY_PERCENT_HEIGHT = 0.9;
  static const double EIGHT_PERCENT_HEIGHT = 0.8;
  static const double EIGHT_FIVE_PERCENT_HEIGHT = 0.85;
  static const double SEVENTY_PERCENT_HEIGHT = 0.7;
  static const double SIXTY_PERCENT_HEIGHT = 0.6;
  static const double FIFTY_PERCENT_HEIGHT = 0.5;
  static const double THIRTY_PERCENT_HEIGHT = 0.3;
  static const double TWENTY_PERCENT_HEIGHT = 0.2;
  static const double TEN_PERCENT_HEIGHT = 0.1;
  static const double FIVE_PERCENT_HEIGHT = 0.05;

  static const double buttonFontSizeSmall = 16;
  static void screenSizeMethod({required BuildContext context}) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;
  }
}
