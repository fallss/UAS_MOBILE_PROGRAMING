import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 0.h),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Types of data we collect',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'lbl_about1'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '2. Use of your personal data ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'lbl_about2'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '3.Disclosure of your personal data',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'lbl_about3'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 58.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.back,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 18.v,
          bottom: 18.v,
        ),
        onTap: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: Text(
        'About us',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
      ),
      styleType: Style.bgOutline,
    );
  }
}
