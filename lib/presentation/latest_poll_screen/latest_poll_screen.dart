import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../../core/data_file/data_file.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../home_screen_page/models/next_trip_model.dart';
import '../home_screen_page/models/tips_model.dart';
import 'controller/latest_poll_controller.dart';
import 'models/listicheart_one1_item_model.dart';
import 'models/stack_item_model.dart';
import 'widgets/listicheart_one1_item_widget.dart';
import 'widgets/stack_item_widget.dart'; // ignore_for_file: must_be_immutable

class LatestPollScreen extends GetWidget<LatestPollController> {
  const LatestPollScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16.v, bottom: 24.h),
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
                    _buildColumnspacer1(),
                    SizedBox(height: 16.v),
                    _buildColumnspacer2(),
                    SizedBox(height: 16.v),
                    _buildColumnspacer3()
                  ],
                ),
              ),
            ),



            // Column(
            //   children: [
            //     _buildColumnspacer(),
            //     SizedBox(height: 16.v),
            //     _buildColumnspacer1(),
            //     SizedBox(height: 16.v),
            //     _buildColumnspacer2(),
            //     SizedBox(height: 16.v),
            //     _buildColumnspacer3()
            //   ],
            // ),
          ),
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
        onTap: (){
          Get.back();
        },
      ),
      // onBackPress: () {
      //   Get.back();
      // },
      centerTitle: true,
      title: Text(
        'Latest polls',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
      ),
      // text: "lbl_latest_polls".tr,
      // title: AppbarTitle(
      //   text: "lbl_latest_polls".tr,
      // ),
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
  Widget _buildColumnwhichcity() {
    final List<NextTripModel> list = DataFile.latestPoll;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "msg_which_city_is_best".tr,
          style: CustomTextStyles.titleMediumBlack90017,
        ),
        SizedBox(height: 16.v),
        ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(() {
                return GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = index;
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: controller.currentIndex.value == index
                        ? AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          )
                        : AppDecoration.outlineGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: list[index].width,
                          padding: EdgeInsets.symmetric(vertical: 10.v),
                          decoration: AppDecoration.fillDeepPurple.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL11,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0.h),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 26.h,
                                  // margin: EdgeInsets.only(bottom: 1.v),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.h,
                                    vertical: 2.v,
                                  ),
                                  decoration: AppDecoration.fillGray.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder12,
                                  ),
                                  child: Center(
                                    child: Text(
                                      list[index].option.tr.toUpperCase(),
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.h,
                                    // bottom: 1.v,
                                  ),
                                  child: Text(
                                    list[index].title.tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 13.v,
                            right: 15.h,
                            bottom: 12.v,
                          ),
                          child: Text(
                            list[index].vote.tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
            itemCount: list.length),
        // SizedBox(height: 16.v),
        // Container(
        //   decoration: AppDecoration.outlineGray.copyWith(
        //     borderRadius: BorderRadiusStyle.roundedBorder12,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 12.h,
        //           vertical: 10.v,
        //         ),
        //         decoration: AppDecoration.fillIndigo.copyWith(
        //           borderRadius: BorderRadiusStyle.customBorderTL11,
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               width: 26.adaptSize,
        //               margin: EdgeInsets.only(bottom: 1.v),
        //               padding: EdgeInsets.symmetric(
        //                 horizontal: 7.h,
        //                 vertical: 2.v,
        //               ),
        //               decoration: AppDecoration.fillGray.copyWith(
        //                 borderRadius: BorderRadiusStyle.roundedBorder12,
        //               ),
        //               child: Text(
        //                 "lbl_b".tr.toUpperCase(),
        //                 style: theme.textTheme.titleMedium,
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(
        //                 left: 8.h,
        //                 top: 3.v,
        //                 bottom: 1.v,
        //               ),
        //               child: Text(
        //                 "lbl_paris".tr,
        //                 style: theme.textTheme.bodyLarge,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(
        //           top: 13.v,
        //           right: 15.h,
        //           bottom: 12.v,
        //         ),
        //         child: Text(
        //           "lbl_29".tr,
        //           style: theme.textTheme.bodyLarge,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // SizedBox(height: 16.v),
        // Container(
        //   decoration: AppDecoration.outlinePrimary.copyWith(
        //     borderRadius: BorderRadiusStyle.roundedBorder12,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 12.h,
        //           vertical: 10.v,
        //         ),
        //         decoration: AppDecoration.fillIndigo5001.copyWith(
        //           borderRadius: BorderRadiusStyle.customBorderTL11,
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               width: 26.adaptSize,
        //               margin: EdgeInsets.only(bottom: 1.v),
        //               padding: EdgeInsets.symmetric(
        //                 horizontal: 6.h,
        //                 vertical: 2.v,
        //               ),
        //               decoration: AppDecoration.fillGray.copyWith(
        //                 borderRadius: BorderRadiusStyle.roundedBorder12,
        //               ),
        //               child: Text(
        //                 "lbl_c".tr.toUpperCase(),
        //                 style: theme.textTheme.titleMedium,
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(
        //                 left: 8.h,
        //                 top: 3.v,
        //                 bottom: 1.v,
        //               ),
        //               child: Text(
        //                 "lbl_paris".tr,
        //                 style: theme.textTheme.bodyLarge,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(
        //           top: 13.v,
        //           right: 15.h,
        //           bottom: 12.v,
        //         ),
        //         child: Text(
        //           "lbl_33".tr,
        //           style: theme.textTheme.bodyLarge,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // SizedBox(height: 16.v),
        // Container(
        //   decoration: AppDecoration.outlineGray300.copyWith(
        //     borderRadius: BorderRadiusStyle.roundedBorder12,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 12.h,
        //           vertical: 10.v,
        //         ),
        //         decoration: AppDecoration.fillIndigo.copyWith(
        //           borderRadius: BorderRadiusStyle.customBorderTL11,
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               width: 26.adaptSize,
        //               margin: EdgeInsets.only(bottom: 1.v),
        //               padding: EdgeInsets.symmetric(
        //                 horizontal: 7.h,
        //                 vertical: 2.v,
        //               ),
        //               decoration: AppDecoration.fillGray.copyWith(
        //                 borderRadius: BorderRadiusStyle.roundedBorder12,
        //               ),
        //               child: Text(
        //                 "lbl_d".tr.toUpperCase(),
        //                 style: theme.textTheme.titleMedium,
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(
        //                 left: 8.h,
        //                 top: 3.v,
        //                 bottom: 1.v,
        //               ),
        //               child: Text(
        //                 "lbl_paris".tr,
        //                 style: theme.textTheme.bodyLarge,
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(
        //           top: 13.v,
        //           right: 15.h,
        //           bottom: 12.v,
        //         ),
        //         child: Text(
        //           "lbl_32".tr,
        //           style: theme.textTheme.bodyLarge,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        SizedBox(height: 24.v),
        Row(
          children: [
            CustomElevatedButton(
              width: 99.h,
              height: 41.h,
              text: "lbl_submit".tr,onPressed: () {
              Get.toNamed(AppRoutes.pollDetailsPage);              },
              buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
            ),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    // top: 2.v,
                  ),
                  child: GestureDetector(
                    onTap: () =>    Get.toNamed(AppRoutes.ronaldRichardsScreen),
                    child: _buildColumnronaldric(
                      ronaldrichards: "lbl_ronald_richards".tr,
                      duration: "lbl_1_hours_ago".tr,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              _buildFollowing()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 20.v),
          _buildColumnwhichcity()
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnspacer1() {
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    // top: 4.v,
                  ),
                  child: GestureDetector(
                    onTap: () =>    Get.toNamed(AppRoutes.ronaldRichardsScreen),
                    child: _buildColumnjennywils(
                      jennywilsonOne: "lbl_jenny_wilson".tr,
                      duration: "lbl_16_hours_ago".tr,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              CustomOutlinedButton(
                width: 116.h,
                text: "lbl_following".tr,
                margin: EdgeInsets.only(
                  top: 4.v,
                  bottom: 5.v,
                ),
                buttonTextStyle: CustomTextStyles.bodyLargePrimary,
              )
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            "msg_which_style_do_you".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 16.v),
          SizedBox(
            height: 178.v,
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16.h,
                  );
                },
                itemCount: controller.latestPollModelObj.value
                    .listicheartOne1ItemList.value.length,
                itemBuilder: (context, index) {
                  ListicheartOne1ItemModel model = controller.latestPollModelObj
                      .value.listicheartOne1ItemList.value[index];
                  return ListicheartOne1ItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 24.v),
          Row(
            children: [
              CustomElevatedButton(
                width: 99.h,
                height: 41.h,
                text: "lbl_submit".tr,onPressed: () {
                Get.toNamed(AppRoutes.pollDetailsPage);
                },
                buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
              ),
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
  Widget _buildSubmit() {
    return CustomElevatedButton(
      width: 99.h,
      height: 41.h,
      text: "lbl_submit".tr,onPressed: () {
      Get.toNamed(AppRoutes.pollDetailsPage);
      },
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer2() {
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    // top: 4.v,
                  ),
                  child: GestureDetector(

                    onTap: () =>    Get.toNamed(AppRoutes.ronaldRichardsScreen),
                    child: _buildColumnjennywils(
                      jennywilsonOne: "lbl_jenny_wilson".tr,
                      duration: "lbl_16_hours_ago".tr,
                    ),
                  ),
                ),
              ),
              _buildFollowing1()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 20.v),
          Text(
            "msg_which_place_do_you".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 15.v),
          SizedBox(
            height: 178.v,
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16.h,
                  );
                },
                itemCount: controller
                    .latestPollModelObj.value.stackItemList.value.length,
                itemBuilder: (context, index) {
                  StackItemModel model = controller
                      .latestPollModelObj.value.stackItemList.value[index];
                  return StackItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 24.v),
          Row(
            children: [
              _buildSubmit(),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgIcLikeGray700,
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
                  style: theme.textTheme.bodyMedium,
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
  Widget _buildFollowing2() {
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
  Widget _buildOption() {
    final List<TipsList> list = DataFile.carBrand;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "msg_which_car_brand".tr,
          style: CustomTextStyles.titleMediumBlack90017,
        ),
        SizedBox(height: 15.v),
        ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Obx(() {
                return GestureDetector(
                  onTap: () {
                    controller.currentIndex1.value = index;
                  },
                  child: _buildRowbOne(
                    decoration: controller.currentIndex1.value == index
                        ? AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          )
                        : AppDecoration.outlineGray300.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12,
                          ),
                    bOne: list[index].option!,
                    parisFive: list[index].title!.tr,
                  ),
                );
              });
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
            itemCount: list.length),
        // _buildRowbOne(
        //   bOne: "lbl_a".tr,
        //   parisFive: "lbl_lamborghini".tr,
        // ),
        // SizedBox(height: 16.v),
        // _buildRowbOne(
        //   bOne: "lbl_b".tr,
        //   parisFive: "lbl_toyota".tr,
        // ),
        // SizedBox(height: 16.v),
        // _buildRowbOne(
        //   bOne: "lbl_c".tr,
        //   parisFive: "lbl_range_rover".tr,
        // ),
        // SizedBox(height: 16.v),
        // _buildRowbOne(
        //   bOne: "lbl_d".tr,
        //   parisFive: "lbl_bmw".tr,)
      ],
    );
  }

  /// Section Widget
  Widget _buildSubmit1() {
    return CustomElevatedButton(
      width: 99.h,
      height: 41.h,
      text: "lbl_submit".tr,onPressed: () {
      Get.toNamed(AppRoutes.pollDetailsPage);
      },
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer3() {
    return Container(
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    // top: 2.v,
                  ),
                  child: GestureDetector(
                    onTap: () =>    Get.toNamed(AppRoutes.ronaldRichardsScreen),
                    child: _buildColumnronaldric(
                      ronaldrichards: "lbl_ronald_richards".tr,
                      duration: "lbl_1_hours_ago".tr,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              _buildFollowing2()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 20.v),
          _buildOption(),
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
                  top: 9.v,
                  bottom: 14.v,
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
                  top: 9.v,
                  bottom: 14.v,
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
  Widget _buildColumnjennywils({
    required String jennywilsonOne,
    required String duration,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          jennywilsonOne,
          style: CustomTextStyles.titleMediumBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          duration,
          style: CustomTextStyles.bodyMediumBlack900_1.copyWith(
            color: appTheme.black900,
          ),
        )
      ],
    );
  }

  /// Common widget
  Widget _buildColumnronaldric({
    required String ronaldrichards,
    required String duration,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ronaldrichards,
          style: CustomTextStyles.titleMediumBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
        SizedBox(height: 4.v),
        Text(
          duration,
          style: CustomTextStyles.bodyMediumBlack900_1.copyWith(
            color: appTheme.black900,
          ),
        )
      ],
    );
  }

  /// Common widget
  Widget _buildRowbOne({
    required String bOne,
    required String parisFive,
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
              bOne,
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
              parisFive,
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
