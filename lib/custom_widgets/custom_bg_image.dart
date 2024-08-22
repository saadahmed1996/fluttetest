import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_project/utils/assets_path.dart';

class CustomBgImageContainerWidget extends StatelessWidget {
  final String? bgImagePath;
  final Widget? child;
  BoxFit? fit;
  CustomBgImageContainerWidget(
      {Key? key, this.child, this.bgImagePath, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImagePath ?? AssetPaths.app_bg),
          fit: fit ?? BoxFit.fill,
          scale: 3.5.sp,
        ),
      ),
      child: child ?? Container(),
    );
  }
}
