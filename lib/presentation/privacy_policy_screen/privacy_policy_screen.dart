import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/privacy_policy_controller.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  PrivacyPolicyController controller = Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 0.0.h),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 20.0.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. Pengumpulan Data Pribadi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'lbl_privacy_policy'.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '2. Penggunaan Data Pribadi ',
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
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '3.Keamanan Data dan Hak Pengguna',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.3,
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
                    fontFamily: 'Roboto',
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
      title: AppbarTitle(
        text: "Privacy Policy".tr,
      ),
      styleType: Style.bgOutline,
    );
  }
}
