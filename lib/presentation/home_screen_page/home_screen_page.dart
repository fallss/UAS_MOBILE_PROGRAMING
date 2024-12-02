// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../../core/data_file/data_file.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';
import 'models/listicheart_one_item_model.dart';
import 'models/next_trip_model.dart';
import 'models/tips_model.dart';
import 'models/userprofile_item_model.dart';
import 'widgets/listicheart_one_item_widget.dart';
import 'widgets/userprofile_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key})
      : super(
          key: key,
        );

  HomeScreenController controller =
      Get.put(HomeScreenController(HomeScreenModel().obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              SizedBox(height: 24.v),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hello, \IFHAL FAIZI 👋',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.fSize,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 36.h,
                    width: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      border: Border.all(
                        color: appTheme.gray300,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: CustomImageView(
                        onTap: () {
                          Get.toNamed(AppRoutes.notificationPage);
                        },
                        imagePath: ImageConstant.imgIcNotifications,
                        height: 22.h,
                        width: 22.h,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.v),

              Expanded(
                child: AnimationLimiter(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 24.h),
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        _buildRow06activepoll(),
                        SizedBox(height: 16.v),
                        _buildTitleandview(
                          popular: "lbl_latest_polls".tr,
                          viewallOne: "lbl_view_all".tr,
                          onTapViewallOne: () {
                            onTapTxtViewallOne();
                          },
                        ),
                        SizedBox(height: 16.v),
                        _buildColumnspacer(),
                        SizedBox(height: 16.v),
                        _buildColumnspacer1(),
                        SizedBox(height: 16.v),
                        _buildPopular(),
                        SizedBox(height: 16.v),
                        _buildTitleandview(
                          popular: "lbl_trending_polls".tr,
                          viewallOne: "lbl_view_all".tr,
                          onTapViewallOne: () {
                            onTapTxtViewallOne1();
                          },
                        ),
                        SizedBox(height: 16.v),
                        _buildColumnspacer2()
                      ],
                    ),
                  ),
                ),
              ),
              // Expanded(
              //     child: ListView(
              //   padding: EdgeInsets.only(bottom: 24.h),
              //   children: [
              //     _buildRow06activepoll(),
              //     SizedBox(height: 16.v),
              //     _buildTitleandview(
              //       popular: "lbl_latest_polls".tr,
              //       viewallOne: "lbl_view_all".tr,
              //       onTapViewallOne: () {
              //         onTapTxtViewallOne();
              //       },
              //     ),
              //     SizedBox(height: 16.v),
              //     _buildColumnspacer(),
              //     SizedBox(height: 16.v),
              //     _buildColumnspacer1(),
              //     SizedBox(height: 16.v),
              //     _buildPopular(),
              //     SizedBox(height: 16.v),
              //     _buildTitleandview(
              //       popular: "lbl_trending_polls".tr,
              //       viewallOne: "lbl_view_all".tr,
              //       onTapViewallOne: () {
              //         onTapTxtViewallOne1();
              //       },
              //     ),
              //     SizedBox(height: 16.v),
              //     _buildColumnspacer2()
              //   ],
              // ))
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRow06activepoll() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_06_active_polls".tr,
                  style: CustomTextStyles.titleLargeOnPrimary,
                ),
                SizedBox(height: 12.v),
                Text(
                  "lbl_see_details".tr,
                  style: CustomTextStyles.bodyLargeOnPrimary,
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 10.v,
                bottom: 9.v,
              ),
              child: Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomImageView(
                    imagePath: ImageConstant.imgIcArrowRight,
                    height: 24.44.h,
                    width: 24.44.h,
                  ),
                ),
              )
              // child: CustomIconButton(
              //   height: 40.adaptSize,
              //   width: 40.adaptSize,
              //   padding: EdgeInsets.all(7.h),
              //   child: CustomImageView(
              //     imagePath: ImageConstant.imgIcArrowRight,
              //   ),
              // ),
              )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFollowing() {
    return CustomOutlinedButton(
      width: 116.h,
      height: 41.h,
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
    final List<NextTripModel> list = DataFile.nextTripList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "msg_which_city_is_best".tr,
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
        SizedBox(height: 24.v),
        Row(
          children: [
            CustomElevatedButton(
              height: 41.h,
              width: 99.h,
              onPressed: () {
                Get.toNamed(AppRoutes.pollDetailsPage);
              },
              text: "lbl_submit".tr,
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
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.ronaldRichardsScreen);
            },
            child: Row(
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
                    child: _buildColumnronaldric(
                      ronaldrichards: "lbl_ronald_richards".tr,
                      duration: "lbl_1_hours_ago".tr,
                    ),
                  ),
                ),
                _buildFollowing()
              ],
            ),
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
      height: 41.h,
      width: 99.h,
      onPressed: () {
        Get.toNamed(AppRoutes.pollDetailsPage);
      },
      text: "lbl_submit".tr,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer1() {
    return Container(
      padding: EdgeInsets.all(16.h),
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
                ),
                _buildFollowing1()
              ],
            ),
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
                itemCount: controller.homeScreenModelObj.value
                    .listicheartOneItemList.value.length,
                itemBuilder: (context, index) {
                  ListicheartOneItemModel model = controller.homeScreenModelObj
                      .value.listicheartOneItemList.value[index];
                  return ListicheartOneItemWidget(
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
                imagePath: ImageConstant.imgIcLike,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(
                    // top: 9.v,
                    // bottom: 8.v,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  // top: 13.v,
                  // bottom: 11.v,
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
                  // top: 9.v,
                  // bottom: 8.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  // top: 13.v,
                  // bottom: 11.v,
                ),
                child: Text(
                  "lbl_1_8k".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  // top: 9.v,
                  // bottom: 8.v,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.share,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),

                // Obx(
                //       () =>
                //       CustomCheckboxButton(
                //         text: "lbl_4_8k".tr,
                //         value: controller.kone.value,
                //         padding: EdgeInsets.symmetric(vertical: 3.v),
                //         onChange: (value) {
                //           controller.kone.value = value;
                //         },
                //       ),
                // ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  // top: 13.v,
                  // bottom: 11.v,
                ),
                child: Text(
                  "4.8k".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPopular() {
    return Column(
      children: [
        _buildTitleandview(
          onTapViewallOne: () {
            Get.toNamed(AppRoutes.popularCreatorsPage);
          },
          popular: "msg_popular_creators".tr,
          viewallOne: "lbl_view_all".tr,
        ),
        SizedBox(height: 16.v),
        SizedBox(
          height: 90.v,
          child: GridView.builder(
            primary: true,
            shrinkWrap: true,
            // padding: EdgeInsets.symmetric(horizontal: 20.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.homeScreenModelObj.value.userprofileItemList
                        .value.length >
                    4
                ? 4
                : controller
                    .homeScreenModelObj.value.userprofileItemList.value.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 88.v,
              crossAxisSpacing: 16.h,
              mainAxisSpacing: 16.h,
            ),
            itemBuilder: (context, index) {
              UserprofileItemModel model = controller
                  .homeScreenModelObj.value.userprofileItemList.value[index];
              return GestureDetector(
                onTap: () {
                  // Get.to(() => RonaldRichardsScreen(index));
                  // print("fmejfjfj--e423--${index}   }");

                  Get.toNamed(AppRoutes.ronaldRichardsScreen, arguments: index);
                },
                child: UserprofileItemWidget(model),
              );
            },
          ),
        ),
        // SizedBox(
        //   height: 100.v,
        //   child: Obx(
        //     () => GridView.builder(
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 1,
        //         crossAxisSpacing: 10.h,
        //         mainAxisSpacing: 10.v,
        //         mainAxisExtent: 100.v,
        //       ),
        //       padding: EdgeInsets.zero,
        //       scrollDirection: Axis.horizontal,
        //       // separatorBuilder: (context, index) {
        //       //   return SizedBox(
        //       //     width: 20.h,
        //       //   );
        //       // },
        //       itemCount: controller
        //           .homeScreenModelObj.value.userprofileItemList.value.length,
        //       itemBuilder: (context, index) {
        //         UserprofileItemModel model = controller
        //             .homeScreenModelObj.value.userprofileItemList.value[index];
        //         return GestureDetector(
        //           onTap: () {
        //             Get.toNamed(AppRoutes.ronaldRichardsScreen);
        //           },
        //           child: UserprofileItemWidget(
        //             model,
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // )
      ],
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
  Widget _buildSubmit1() {
    return CustomElevatedButton(
      height: 41.v,
      width: 99.h,
      onPressed: () {
        Get.toNamed(AppRoutes.pollDetailsPage);
      },
      text: "lbl_submit".tr,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer2() {
    final List<TipsList> list = DataFile.tipsList;

    return Container(
      padding: EdgeInsets.all(16.h),
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    // top: 2.v,
                  ),
                  child: _buildColumnronaldric(
                    ronaldrichards: "lbl_ronald_richards".tr,
                    duration: "lbl_1_hours_ago".tr,
                  ),
                ),
                Spacer(),
                _buildFollowing2()
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 20.v),
          Text(
            "msg_which_country_is".tr,
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
          //   parisFive: "lbl_australia".tr,
          // ),
          // SizedBox(height: 16.v),
          // _buildRowbOne(
          //   bOne: "lbl_b".tr,
          //   parisFive: "lbl_bangkok".tr,
          // ),
          // SizedBox(height: 16.v),
          // _buildRowbOne(
          //   bOne: "lbl_c".tr,
          //   parisFive: "lbl_south_korea".tr,
          // ),
          // SizedBox(height: 16.v),
          // _buildRowbOne(
          //   bOne: "lbl_d".tr,
          //   parisFive: "lbl_hong_kong".tr,
          // ),
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
                    // top: 9.v,
                    // bottom: 8.v,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  // top: 13.v,
                  // bottom: 11.v,
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
                  // top: 9.v,
                  // bottom: 8.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  // top: 13.v,
                  // bottom: 11.v,
                ),
                child: Text(
                  "lbl_1_8k".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  // top: 9.v,
                  // bottom: 8.v,
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
                //         value: controller.ktwo.value,
                //         padding: EdgeInsets.symmetric(vertical: 3.v),
                //         onChange: (value) {
                //           controller.ktwo.value = value;
                //         },
                //       ),
                // ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  // top: 13.v,
                  // bottom: 11.v,
                ),
                child: Text(
                  "4.8k".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTitleandview({
    required String popular,
    required String viewallOne,
    Function? onTapViewallOne,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          popular,
          style: theme.textTheme.titleLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
        GestureDetector(
          onTap: () {
            onTapViewallOne?.call();
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Text(
              viewallOne,
              style: CustomTextStyles.bodyMediumBlack900.copyWith(
                color: appTheme.black900,
              ),
            ),
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

  /// Navigates to the latestPollScreen when the action is triggered.
  onTapTxtViewallOne() {
    Get.toNamed(
      AppRoutes.latestPollScreen,
    );
  }

  /// Navigates to the trendingPollsScreen when the action is triggered.
  onTapTxtViewallOne1() {
    Get.toNamed(
      AppRoutes.trendingPollsScreen,
    );
  }
}
