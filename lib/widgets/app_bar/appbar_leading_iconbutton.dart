// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Container(
          height: 40.h,
          width: 40.h,
          decoration:BoxDecoration(
            shape: BoxShape.circle,
            color: appTheme.gray50,

          ),
          child: Center(
            child: CustomImageView(
              imagePath: ImageConstant.back,
              height: 20.h,
              width: 20.h,
            ),
          ),
        )
      ),
    );
  }
}
