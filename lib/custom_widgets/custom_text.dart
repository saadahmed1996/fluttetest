import "dart:ui";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_test_project/utils/app_colors.dart";
import "package:flutter_test_project/utils/app_fonts.dart";

class CustomText extends StatelessWidget {
  String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontsize;
  AlignmentGeometry? align;
  TextAlign? textAlign;
  List<FontFeature>? fontFeatures;
  final int? maxLines;
  bool isLeftAlign;
  TextDecoration? textDecoration;
  String? fontFamily;
  CustomText({
    Key? key,
    this.text,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.fontsize,
    this.fontFeatures,
    this.maxLines,
    this.align,
    this.isLeftAlign = true,
    this.textDecoration,
    this.fontFamily,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align ??
          (isLeftAlign == true ? Alignment.centerLeft : Alignment.center),
      child: Text(
        textAlign: isLeftAlign == false ? TextAlign.center : null,
        maxLines: maxLines,
        overflow:
            maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
        text ?? " ",
        style: TextStyle(
          fontFeatures: fontFeatures,
          fontSize: fontsize ?? 22.sp,
          color: color ?? AppColors.whiteColor,
          decoration: textDecoration,
          fontFamily: fontFamily ?? AppFonts.robotoRegular,
        ),
      ),
    );
  }
}
