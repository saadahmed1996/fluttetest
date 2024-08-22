import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/custom_widgets/custom_text.dart';
import 'package:flutter_test_project/utils/app_colors.dart';

class CustomEmptyData extends StatelessWidget {
  CustomEmptyData(
      {Key? key,
      this.title,
      this.image,
      this.imageColor,
      this.hasLoader,
      this.textColor,
      this.paddingVertical})
      : super(key: key);
  String? title, image;
  Color? imageColor;
  bool? hasLoader;
  double? paddingVertical;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return hasLoader == false
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 6.h),
              child: CustomText(
                text: title ?? "Not available",
                color: textColor ?? AppColors.blackColor,
                fontsize: 15,
              ),
            ),
          )
        : Stack(
            children: [
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: 100.h,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (image != null) ...[
                      Image.asset(
                        image!,
                        width: 6.w,
                        color: imageColor,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                    CustomText(
                      text: title ?? "Not available",
                      color: textColor ?? AppColors.blackColor,
                      fontsize: 15,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
