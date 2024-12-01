import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../../core/data_file/data_file.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../home_screen_page/models/tips_model.dart';
import 'controller/trending_polls_controller.dart'; // ignore_for_file: must_be_immutable

class TrendingPollsScreen extends GetWidget<TrendingPollsController> {
  const TrendingPollsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 24.v),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
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
                  _buildColumnspacer(),
                  SizedBox(height: 16.v),
                  _buildColumnlineone()
                ],
              ),
            ),
          ),

          // Column(
          //   children: [
          //     _buildColumnspacer(),
          //     SizedBox(height: 16.v),
          //     _buildColumnlineone()
          //   ],
          // ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      // onBackPress: () {
      //   Get.back();
      // },
      leadingWidth: 56.h,
      leading: AppbarLeadingIconbutton(
        margin: EdgeInsets.only(
          left: 16.h,
          top: 21.v,
          bottom: 18.v,
        ),
        onTap: () {
          Get.back();
        },

      ),
      centerTitle: true,

      title: Text(
        'Trending polls',
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

  /// Section Widget
  Widget _buildFollowing() {
    return CustomOutlinedButton(
      width: 116.h,
      text: "lbl_following".tr,
      margin: EdgeInsets.only(
        top: 4.v,
        bottom: 5.v,
      ),
      buttonTextStyle: CustomTextStyles.bodyLargePrimary,
    );
  }

  /// Section Widget
  Widget _buildSubmit() {
    return CustomElevatedButton(
      width: 99.h,
      height: 41.h,
      text: "lbl_submit".tr,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer() {
    final List<TipsList> list = DataFile.trendingPoll;
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.ronaldRichardsScreen);
            },
            child: Row(

              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse241,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  radius: BorderRadius.circular(
                    25.h,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 2.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_ronald_richards".tr,
                          style: CustomTextStyles.titleMediumBlack900,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "lbl_1_hours_ago".tr,
                          style: CustomTextStyles.bodyMediumBlack900_1,
                        ),
                      ],
                    ),
                  ),
                ),
                // Spacer(),
                _buildFollowing()
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            "msg_which_country_is".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 16.v),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.isSelect.value = index;
                    },
                    child: _buildRowb(
                      b: list[index].option!.tr,
                      parisOne: list[index].title!.tr,
                      decoration: controller.isSelect.value == index
                          ? AppDecoration.outlinePrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            )
                          : AppDecoration.outlineGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            ),
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
              itemCount: list.length),
          // _buildRowb(
          //   b: "lbl_a".tr,
          //   parisOne: "lbl_australia".tr,
          // ),
          // SizedBox(height: 16.v),
          // _buildRowb(
          //   b: "lbl_b".tr,
          //   parisOne: "lbl_bangkok".tr,
          // ),
          // SizedBox(height: 16.v),
          // _buildRowb(
          //   b: "lbl_c".tr,
          //   parisOne: "lbl_south_korea".tr,
          // ),
          // SizedBox(height: 16.v),
          // _buildRowb(
          //   b: "lbl_d".tr,
          //   parisOne: "lbl_hong_kong".tr,
          // ),
          SizedBox(height: 24.v),
          Row(
            children: [
              _buildSubmit(),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgIcLike,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(
                  top: 9.v,
                  bottom: 8.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 13.v,
                  bottom: 11.v,
                ),
                child: Text(
                  "lbl_2_4k".tr,
                  style: CustomTextStyles.bodyMediumBlack900_1,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIcComment,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(
                  left: 16.h,
                  top: 9.v,
                  bottom: 8.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 13.v,
                  bottom: 11.v,
                ),
                child: Text(
                  "lbl_1_8k".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 9.v,
                  bottom: 8.v,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.share,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              SizedBox(
                width: 4.h,
              ),
              Text(
                '4.8k',
                style: TextStyle(
                  color: appTheme.gray700,
                  fontSize: 13.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFollowing1() {
    return CustomOutlinedButton(
      width: 116.h,
      text: "lbl_following".tr,
      margin: EdgeInsets.only(
        top: 4.v,
        bottom: 5.v,
      ),
      buttonTextStyle: CustomTextStyles.bodyLargePrimary,
    );
  }


  /// Section Widget
  Widget _buildSubmit1() {
    return CustomElevatedButton(
      width: 99.h,
      height: 41.h,
      text: "lbl_submit".tr,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnlineone() {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () =>    Get.toNamed(AppRoutes.ronaldRichardsScreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse24150x50,
                      height: 50.adaptSize,
                      width: 50.adaptSize,
                      radius: BorderRadius.circular(
                        25.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.v, left: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_jenny_wilson".tr,
                            style: CustomTextStyles.titleMediumBlack900,
                          ),
                          SizedBox(height: 7.v),
                          Text(
                            "lbl_16_hours_ago".tr,
                            style: CustomTextStyles.bodyMediumBlack900_1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _buildFollowing1()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            'Which bike do you like?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.fSize,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.v),
          Row(

            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle3845,
                    height: 178.v,
                    width: 174.h,
                    radius: BorderRadius.circular(
                      12.h,
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 12.h,bottom: 12.h),
                    child: Container(
                      width: 31.h,
                      height: 32.h,
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 4.h,
                      //   vertical: 8.v,
                      // ),
                      decoration: AppDecoration.fillOnPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder16,
                      ),
                      child: Center(
                        child: Text(
                          "lbl_56".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16.h,
              ),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle3846,
                    height: 178.v,
                    width: 174.h,
                    radius: BorderRadius.circular(
                      12.h,
                    ),
                    alignment: Alignment.bottomRight,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 12.h,bottom: 12.h),
                    child: Container(
                      width: 31.h,
                      height: 32.h,
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 4.h,
                      //   vertical: 8.v,
                      // ),
                      decoration: AppDecoration.fillOnPrimary.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder16,
                      ),
                      child: Center(
                        child: Text(
                          "lbl_56".tr,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Stack(
          //   alignment: Alignment.bottomRight,
          //   children: [
          //     CustomImageView(
          //       imagePath: ImageConstant.imgRectangle3845,
          //       height: 178.v,
          //       width: 174.h,
          //       radius: BorderRadius.circular(
          //         12.h,
          //       ),
          //       alignment: Alignment.bottomLeft,
          //     ),
          //     SizedBox(
          //       width: 16.h,
          //     ),
          //     CustomImageView(
          //       imagePath: ImageConstant.imgRectangle3846,
          //       height: 178.v,
          //       width: 174.h,
          //       radius: BorderRadius.circular(
          //         12.h,
          //       ),
          //       alignment: Alignment.bottomRight,
          //     ),
          //     _buildColumnwhichstyl()
          //   ],
          // ),
          SizedBox(height: 24.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSubmit1(),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgIcLike,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(
                  top: 9.v,
                  bottom: 8.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 12.v,
                  bottom: 8.v,
                ),
                child: Text(
                  "lbl_2_4k".tr,
                  style: CustomTextStyles.bodyMediumBlack900_1,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgIcComment,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(
                  left: 16.h,
                  top: 9.v,
                  bottom: 8.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  top: 12.v,
                  bottom: 8.v,
                ),
                child: Text(
                  "lbl_1_8k".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 9.v,
                  bottom: 8.v,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.share,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              SizedBox(
                width: 4.h,
              ),
              Text(
                '4.8k',
                style: TextStyle(
                  color: appTheme.gray700,
                  fontSize: 13.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRowb({
    required String b,
    required String parisOne,
    required Decoration decoration,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 10.v,
      ),
      decoration: decoration,
      child: Row(
        children: [
          Container(
            width: 26.adaptSize,
            margin: EdgeInsets.only(top: 1.v),
            padding: EdgeInsets.symmetric(
              horizontal: 7.h,
              vertical: 2.v,
            ),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              b,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 5.v,
            ),
            child: Text(
              parisOne,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: appTheme.black900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
