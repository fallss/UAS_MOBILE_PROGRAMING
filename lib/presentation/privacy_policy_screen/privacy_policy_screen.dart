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
                  '1. Types of data we collect',
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
                    fontFamily: 'Roboto',
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
                // Row(
                //   children: [
                //     Obx(() {
                //       return CustomImageView(
                //         height: 24.h,
                //         width: 24.h, onTap: () {
                //         controller.isCheck.value = !controller.isCheck.value;
                //       },
                //         imagePath: controller.isCheck.value ? ImageConstant
                //             .select_checkBox : ImageConstant.unselect_checkBox,
                //       );
                //     }),
                //     SizedBox(
                //       width: 12.h,
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         controller.isCheck.value = !controller.isCheck.value;
                //       },
                //       child: Text.rich(
                //         TextSpan(
                //           children: [
                //             TextSpan(
                //               text: 'I agree with thr ',
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 17.fSize,
                //                 fontFamily: 'SF Pro Display',
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //             TextSpan(
                //               text: 'Privacy Policy',
                //               style: TextStyle(
                //                 color: theme.colorScheme.primary,
                //                 fontSize: 17.fSize,
                //                 fontFamily: 'SF Pro Display',
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 22.h,
                // ),
                // CustomElevatedButton(text: "Confirm".tr,onPressed: () {
                //   Get.back();
                // },),
                // SizedBox(
                //   height: 38.h,
                // ),
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
