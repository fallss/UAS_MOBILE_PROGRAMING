import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/my_profile_controller.dart'; // ignore_for_file: must_be_immutable

class MyProfileScreen extends GetWidget<MyProfileController> {
  const MyProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 24.v,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.avtar,
                    height: 108.adaptSize,
                    width: 108.adaptSize,
                    // radius: BorderRadius.circular(
                    //   40.h,
                    // ),
                  ),
                  Container(
                      height: 34.h,
                      width: 34.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appTheme.gray50,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 16,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Center(
                        child: CustomImageView(
                          imagePath: ImageConstant.camera,
                          height: 20.78.h,
                          width: 20.78.h,
                        ),
                      ))
                ],
              ),
              // child: Container(
              //     width: 80.h,
              //     height: 80.h,
              //     decoration: ShapeDecoration(
              //       color: Color(0xFFFE4753),
              //       shape: OvalBorder(),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "L",
              //         style: theme.textTheme.titleMedium!.copyWith(
              //           color: Colors.white,
              //           fontSize: 34.fSize,
              //           fontFamily: 'SF Pro Display',
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     )),
            ),
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
                    SizedBox(height: 24.v),
                    _buildComponentFiftyTwo(
                      name: "Name".tr,
                      email: "Ronald richards".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildComponentFiftyTwo(
                      name: "Email address".tr,
                      email: "ronaldrichards@gmail.com".tr,
                    ),
                    SizedBox(height: 16.v),
                    _buildComponentFiftyTwo(
                      name: "Phone number".tr,
                      email: "(405) 555-0128".tr,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 58.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.back,
        margin: EdgeInsets.only(
          left: 16.h,
          // top: 18.v,
          // bottom: 18.v,
        ),
        onTap: () {
          onTapArrowLeft();
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.editProfilePage);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appTheme.gray50,
              ),
              child: Center(
                child: CustomImageView(
                  imagePath: ImageConstant.edit,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
            ),
          ),
        ),
      ],
      title: Text(
        'My profile',
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

  /// Common widget
  Widget _buildComponentFiftyTwo({
    required String name,
    required String email,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 15.v,
        bottom: 16.v,
        left: 16.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.gray50,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text(
            name,
            style: theme.textTheme.titleSmall!.copyWith(
              color: appTheme.black900,
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            email,
            style: CustomTextStyles.bodyMediumPrimary.copyWith(
              color: appTheme.gray700,
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
