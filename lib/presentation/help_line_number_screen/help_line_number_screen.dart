import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/help_line_number_controller.dart';

class HelpLineNumberScreen extends GetWidget<HelpLineNumberController> {
  const HelpLineNumberScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.v),
        child: AnimationLimiter(
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
                _buildComponentFortySeven(
                  ImageConstant.instagram,
                  "Instagram",
                  () {
                    // Get.toNamed(AppRoutes.changePasswordPage);
                    // onTapChangePassword();
                  },
                ),
                SizedBox(height: 16.v),
                // _buildComponentFortySeven(
                //   ImageConstant.imgIcChat,
                //   "Refer & Earn",
                //       () {
                //     // onTapHelpContactUs();
                //   },
                // ),
                _buildComponentFortySeven(
                  ImageConstant.facebook,
                  "Facebook",
                  () {
                    // Get.toNamed(AppRoutes.termsConditionsPage);
                    // onTapHelpContactUs();
                  },
                ),
                SizedBox(height: 16.v),
                _buildComponentFortySeven(
                  ImageConstant.whatsApp,
                  "Whatsapp",
                  () {
                    // Get.toNamed(AppRoutes.helpLineNumberPage);
                    // onTapHelpContactUs();
                  },
                ),
                SizedBox(height: 16.v),
                _buildComponentFortySeven(
                  ImageConstant.twitter,
                  "X",
                  () {
                    // Get.toNamed(AppRoutes.aboutUsPage);
                    // onTapHelpContactUs();
                  },
                ),
                SizedBox(height: 16.v),
                // _buildComponentFortySeven(
                //   ImageConstant.logout,
                //   "Log out",
                //       () {
                //     // Get.bottomSheet(LogOutBottomSheet());
                //     // onTapHelpContactUs();
                //   },
                // ),
              ],
            ),
          ),
        ),

        // Column(
        //   children: [
        //     // _buildComponentFortyNine(
        //     //   icChat: ImageConstant.imgIcLock,
        //     //   myProfile: "lbl_change_password".tr,
        //     // ),
        //     // _buildComponentFortySeven(),
        //     // _buildComponentFortyNine(
        //     //   icChat: ImageConstant.imgIcChat,
        //     //   myProfile: "msg_help_contact_us".tr,
        //     // ),
        //     // _buildComponentFifty(),
        //     // SizedBox(height: 5.v),
        //     // _buildComponentFiftyOne()
        //     _buildComponentFortySeven(
        //       ImageConstant.imgIcLock,
        //       "Change Password",
        //       () {
        //         // onTapChangePassword();
        //       },
        //     ),
        //     _buildComponentFortySeven(
        //       ImageConstant.imgIcChat,
        //       "Refer & Earn",
        //       () {
        //         // onTapHelpContactUs();
        //       },
        //     ),
        //     _buildComponentFortySeven(
        //       ImageConstant.imgIcChat,
        //       "Help & Contact Us",
        //       () {
        //         // onTapHelpContactUs();
        //       },
        //     ),
        //     _buildComponentFortySeven(
        //       ImageConstant.imgIcVerifiedUser,
        //       "Privacy Policy",
        //       () {
        //         // onTapHelpContactUs();
        //       },
        //     ),
        //     _buildComponentFortySeven(
        //       ImageConstant.imgIcInfo,
        //       "About Us",
        //       () {
        //         // onTapHelpContactUs();
        //       },
        //     ),
        //     _buildComponentFortySeven(
        //       ImageConstant.logout,
        //       "Log out",
        //       () {
        //         Get.bottomSheet(LogOutBottomSheet());
        //         // onTapHelpContactUs();
        //       },
        //     ),
        //   ],
        // ),
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
          left: 20.h,
          top: 18.v,
          bottom: 18.v,
        ),
        onTap: () {
          onTapArrowLeft();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Helpline number".tr,
      ),
      styleType: Style.bgOutline,
    );
  }

  /// Section Widget
  Widget _buildComponentFortySeven(
      String? image, String? title, void Function()? onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: GestureDetector(
        onTap: () {
          onTap!.call();
        },
        child: Container(
          // height: 64.v,
          width: double.maxFinite,
          padding:
              EdgeInsets.only(top: 8.v, bottom: 8.v, left: 8.h, right: 16.h),
          // padding: EdgeInsets.fromLTRB(20.h, 17.v, 20.h, 24.v),
          decoration: BoxDecoration(
            border: Border.all(color: appTheme.gray300, width: 1.h),
            borderRadius: BorderRadius.circular(12.h),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 48.h,
                width: 48.h,
                decoration: BoxDecoration(
                    color: appTheme.gray50, shape: BoxShape.circle),
                child: Center(
                  child: CustomImageView(
                    imagePath: image,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ),
              ),
              SizedBox(width: 16.h),
              Expanded(
                child: Text(
                  title!.tr,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.fSize,
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.arrow_right,
                height: 24.adaptSize,
                width: 24.adaptSize,
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // ignore: unused_element
  Widget _buildComponentFiftyOne() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(20.h, 17.v, 20.h, 16.v),
      decoration: AppDecoration.outlineGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 107.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.info,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Text(
                    "lbl_about_us".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.arrow_right,
            height: 24.adaptSize,
            width: 24.adaptSize,
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
