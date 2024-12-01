import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../log_out_popup_dialog/controller/log_out_popup_controller.dart';
import '../log_out_popup_dialog/log_out_popup_dialog.dart';
import 'controller/profile_screen_controller.dart';
import 'models/profile_screen_model.dart'; // ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class ProfileScreenPage extends StatelessWidget {
  ProfileScreenPage({Key? key})
      : super(
          key: key,
        );

  ProfileScreenController controller =
      Get.put(ProfileScreenController(ProfileScreenModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppbar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.v),
            Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.fSize,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 21.v),
            Divider(
              thickness: 1,
              color: appTheme.gray300,
            ),
            SizedBox(height: 24.v),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse225,
                      height: 100.adaptSize,
                      width: 100.adaptSize,
                      // radius: BorderRadius.circular(
                      //   50.h,
                      // ),
                    ),
                  ),
                  SizedBox(height: 16.v),
                  Center(
                    child: Text(
                      "lbl_ronald_richards".tr,
                      style: TextStyle(
                        fontSize: 18.fSize,
                        color: Colors.black,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Center(
                    child: Text(
                      "ifhalf21@gmail.com".tr,
                      style: TextStyle(
                        color: appTheme.gray700,
                        fontSize: 17.fSize,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.v),
                  AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.myProfilePage);
                              },
                              child: _buildRowicinfoOne(
                                icinfoOne: ImageConstant.profile,
                                myprofileOne: "My profile".tr,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.aboutUsPage);
                              },
                              child: _buildRowicinfoOne(
                                icinfoOne: ImageConstant.info,
                                myprofileOne: "About us".tr,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.privacyPolicyPage);
                              },
                              child: _buildRowicinfoOne(
                                icinfoOne: ImageConstant.privacy_policy,
                                myprofileOne: "Privacy policy".tr,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.settingsPage);
                              },
                              child: _buildRowicinfoOne(
                                icinfoOne: ImageConstant.setting,
                                myprofileOne: "Settings".tr,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.dialog(AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: const EdgeInsets.only(left: 0),
                                  content: LogOutPopupDialog(
                                    Get.put(
                                      LogOutPopupController(),
                                    ),
                                  ),
                                ));
                              },
                              child: _buildRowicinfoOne(
                                icinfoOne: ImageConstant.logout,
                                myprofileOne: "Log out".tr,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildRowicinfoOne({
    required String icinfoOne,
    required String myprofileOne,
  }) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(12.h),
            decoration: AppDecoration.fillGray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder25,
            ),
            child: CustomImageView(
              imagePath: icinfoOne,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                top: 14.v,
                bottom: 12.v,
              ),
              child: Text(
                myprofileOne,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
          ),
          // Spacer(),
          CustomImageView(
            imagePath: ImageConstant.arrow_right,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              // top: 14.v,
              right: 8.h,
              // bottom: 12.v,
            ),
          )
        ],
      ),
    );
  }
}
