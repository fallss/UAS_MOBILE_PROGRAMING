import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../../core/data_file/data_file.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../home_screen_page/models/tips_model.dart';
import 'controller/ronald_richards_controller.dart'; // ignore_for_file: must_be_immutable

class RonaldRichardsScreen extends GetWidget<RonaldRichardsController> {
  RonaldRichardsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          children: [
            SizedBox(height: 24.v),
            // Hero(
            //    tag: "ImageConstant.imgEllipse225",
            //   child:  Image.asset(
            //     ImageConstant.imgEllipse225,
            //     height: 97.adaptSize,
            //     width: 97.adaptSize,
            //     fit:  BoxFit.cover,
            //
            //   ),
            //   CustomImageView(
            //     imagePath: ImageConstant.imgEllipse225,
            //     height: 97.adaptSize,
            //     width: 97.adaptSize,
            //     radius: BorderRadius.circular(
            //       48.h,
            //     ),
            //   ),
            // ),

            CustomImageView(
              imagePath: ImageConstant.imgEllipse225,
              height: 97.adaptSize,
              width: 97.adaptSize,
              radius: BorderRadius.circular(
                48.h,
              ),
            ),
            SizedBox(height: 16.v),
            Text(
              "lbl_ronald_richards".tr,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 12.v),
            Text(
              "msg_joined_on_21_02_2024".tr,
              style: CustomTextStyles.titleMediumGray700,
            ),
            SizedBox(height: 24.v),
            _buildBasicdetails(),
            SizedBox(height: 16.v),
            _buildFollow(),
            SizedBox(height: 16.v),
            Divider(
              color: appTheme.gray300,
            ),
            SizedBox(height: 16.v),

            AnimationLimiter(
              child: Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 16.h),
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "lbl_listing".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 12.v),
                      _buildColumnlineone(),
                      SizedBox(height: 16.v),
                      _buildColumnspacer(),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //     child: ListView(
            //       physics: BouncingScrollPhysics(),
            //       padding: EdgeInsets.only(bottom: 16.h),
            //       children: [
            //         Align(
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             "lbl_listing".tr,
            //             style: theme.textTheme.titleLarge,
            //           ),
            //         ),
            //         SizedBox(height: 12.v),
            //         _buildColumnlineone(),
            //         SizedBox(height: 16.v),
            //         _buildColumnspacer(),
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
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
      // onBackPress: () {
      //   Get.back();
      // },
      centerTitle: true,
      title: Text(
        'IFHAL FAIZI',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
      ),
      // title: AppbarTitle(
      //   text: "lbl_ronald_richards".tr,
      // ),
      styleType: Style.bgOutline,
    );
  }

  /// Section Widget
  Widget _buildBasicdetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildColumnfive(
            five: "lbl_15".tr,
            following: "lbl_listing".tr,
          ),
          _buildColumnfive(
            five: "lbl_15".tr,
            following: "lbl_followers".tr,
          ),
          _buildColumnfive(
            five: "lbl_05".tr,
            following: "lbl_following".tr,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFollow() {
    return CustomElevatedButton(
      height: 46.v,
      text: "lbl_follow".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL12,
      buttonTextStyle: theme.textTheme.titleSmall!,
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
  Widget _buildColumnlineone() {
    final List<TipsList> list = DataFile.profileTrips;
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_ronald_richards".tr,
                        style: CustomTextStyles.titleMediumBlack900,
                      ),
                      SizedBox(height: 9.v),
                      Text(
                        "lbl_1_hours_ago".tr,
                        style: CustomTextStyles.bodyMediumBlack900_1,
                      )
                    ],
                  ),
                ),
              ),
              _buildFollowing()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            "msg_which_country_is".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 15.v),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedValue.value = index;
                    },
                    child: _buildRowb(
                      decoration: controller.selectedValue.value == index
                          ? AppDecoration.outlinePrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            )
                          : AppDecoration.outlineGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder12,
                            ),
                      b: list[index].option!.tr,
                      parisOne: list[index].title!.tr,
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
                // child: Obx(
                //       () =>
                //       CustomCheckboxButton(
                //         text: "lbl_4_8k".tr,
                //         value: controller.k.value,
                //         padding: EdgeInsets.symmetric(vertical: 3.v),
                //         onChange: (value) {
                //           controller.k.value = value;
                //         },
                //       ),
                // ),
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
  Widget _buildColumnspacer() {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                padding: EdgeInsets.only(left: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_jenny_wilson".tr,
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      "lbl_16_hours_ago".tr,
                      style: CustomTextStyles.bodyMediumBlack900_1,
                    )
                  ],
                ),
              ),
              Spacer(),
              _buildFollowing1()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            "msg_which_bike_do_you".tr,
            style: CustomTextStyles.titleMediumBlack90017,
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
                    padding: EdgeInsets.only(left: 12.h, bottom: 12.h),
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
                    padding: EdgeInsets.only(left: 12.h, bottom: 12.h),
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
          SizedBox(height: 24.v),
          Row(
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
                // child: Obx(
                //       () =>
                //       CustomCheckboxButton(
                //         text: "lbl_4_8k".tr,
                //         value: controller.k.value,
                //         padding: EdgeInsets.symmetric(vertical: 3.v),
                //         onChange: (value) {
                //           controller.k.value = value;
                //         },
                //       ),
                // ),
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
  Widget _buildColumnfive({
    required String five,
    required String following,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          five,
          style: CustomTextStyles.titleMediumBlack900Medium.copyWith(
            color: appTheme.black900,
          ),
        ),
        SizedBox(height: 12.v),
        Text(
          following,
          style: CustomTextStyles.titleMediumBlack900Medium.copyWith(
            color: appTheme.black900,
          ),
        )
      ],
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
