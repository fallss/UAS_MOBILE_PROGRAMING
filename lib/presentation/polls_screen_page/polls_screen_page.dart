import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../core/app_export.dart';
import '../../core/data_file/data_file.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../home_screen_page/models/next_trip_model.dart';
import '../home_screen_page/models/tips_model.dart';
import 'controller/polls_screen_controller.dart';
import 'models/listicheart_one2_item_model.dart';
import 'models/polls_screen_model.dart';
import 'models/stack1_item_model.dart';
import 'widgets/listicheart_one2_item_widget.dart';
import 'widgets/stack1_item_widget.dart'; // ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class PollsScreenPage extends StatelessWidget {
  PollsScreenPage({Key? key})
      : super(
    key: key,
  );

  PollsScreenController controller =
  Get.put(PollsScreenController(PollsScreenModel().obs));

  CustomBottomBarController bottomBarController = Get.put(CustomBottomBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppbar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.v),
            Text(
              'Polls',
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
            controller.pollsScreenModelObj.value
                .listicheartOne2ItemList.value.isNotEmpty?


            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
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
                  ]
                ),
              ),
            )
      
            // Expanded(
            //   child: ListView(
            //     shrinkWrap: true,
            //     padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
            //     children: [
            //       _buildColumnspacer(),
            //       SizedBox(height: 16.v),
            //       _buildColumnspacer1(),
            //       SizedBox(height: 16.v),
            //       _buildColumnspacer2(),
            //       SizedBox(height: 16.v),
            //       _buildColumnspacer3()
            //     ],
            //   ),
            // )
                
                
                
                
                
                :Expanded(child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 35.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath:ImageConstant.pollEmpty,
                    height: 120.h,
                    width: 120.h,
                  ),
                 SizedBox(height: 28.v),
                  Text(
                    'No polls yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.fSize,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Text(
                    'Your polls list is empty please wait for some time go to home and enjoy your service',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.fSize,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 28.v),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 54.h),
                    child: CustomElevatedButton(
                      width: double.infinity,
                      text: 'Go to home',onPressed: () {
                      bottomBarController.getIndex(0);
                      Get.toNamed(AppRoutes.homeScreenPage);
                      },
                      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }


  /// Section Widget
  // PreferredSizeWidget _buildAppbar() {
  //   return CustomAppBar(
  //     // leadingWidth: 40.h,
  //     centerTitle: true,
  //     title: AppbarTitle(
  //       text: "lbl_polls".tr,
  //     ),
  //     // leading: Container(
  //     //   height: 40.h,
  //     //   width: 40.h,
  //     //   decoration:BoxDecoration(
  //     //     shape: BoxShape.circle,
  //     //     color: appTheme.gray50,
  //     //
  //     //   ),
  //     //   child: Center(
  //     //     child: CustomImageView(
  //     //       imagePath: ImageConstant.back,
  //     //       height: 24.adaptSize,
  //     //       width: 24.adaptSize,
  //     //     ),
  //     //   ),
  //     // ),
  //     styleType: Style.bgOutline,
  //   );
  // }

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
      text: "lbl_submit".tr,onPressed: () {
      Get.toNamed(AppRoutes.pollDetailsPage);
      },
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer() {
    final List<NextTripModel> list = DataFile.pollList;
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
                      // top: 2.v,
                    ),
                    child: _buildColumnronaldric(
                      ronaldrichards: "lbl_ronald_richards".tr,
                      duration: "lbl_1_hours_ago".tr,
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
            "msg_which_city_is_best".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 16.v),

          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedValue.value = index;
                    },
                    child: Container(
                      decoration: controller.selectedValue.value == index
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
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 12.h),
                                Container(
                                  width: 26.h,
                                  height: 26.h,
                                  // margin: EdgeInsets.only(bottom: 1.v),
                                  // padding: EdgeInsets.symmetric(
                                  //   horizontal: 6.h,
                                  //   vertical: 2.v,
                                  // ),
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
                                SizedBox(width: 8.h),
                                Text(
                                  list[index].title.tr,
                                  style: theme.textTheme.bodyLarge,
                                )
                              ],
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
              separatorBuilder: (context, index) =>
                  SizedBox(
                    height: 16.h,
                  ),
              itemCount: list.length),
          // Container(
          //   decoration: AppDecoration.outlineGray.copyWith(
          //     borderRadius: BorderRadiusStyle.roundedBorder12,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         width: 92.h,
          //         padding: EdgeInsets.symmetric(vertical: 10.v),
          //         decoration: AppDecoration.fillDeepPurple.copyWith(
          //           borderRadius: BorderRadiusStyle.customBorderTL11,
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          //                 "lbl_a".tr.toUpperCase(),
          //                 style: theme.textTheme.titleMedium,
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.only(
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
          //           "lbl_09".tr,
          //           style: theme.textTheme.bodyLarge,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
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
      height: 41.h,
      width: 99.h,onPressed:  () {
      Get.toNamed(AppRoutes.pollDetailsPage);
      },
      text: "lbl_submit".tr,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
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
                    child: _buildColumnjennywils(
                      jennywilsonOne: "lbl_jenny_wilson".tr,
                      duration: "lbl_16_hours_ago".tr,
                    ),
                  ),
                ),
                // Spacer(),
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
                  () =>
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 16.h,
                      );
                    },
                    itemCount: controller.pollsScreenModelObj.value
                        .listicheartOne2ItemList.value.length,
                    itemBuilder: (context, index) {
                      ListicheartOne2ItemModel model = controller
                          .pollsScreenModelObj
                          .value
                          .listicheartOne2ItemList
                          .value[index];
                      return ListicheartOne2ItemWidget(
                        model,
                      );
                    },
                  ),
            ),
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
           GestureDetector(
            onTap:() {
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
                    child: _buildColumnjennywils(
                      jennywilsonOne: "lbl_jenny_wilson".tr,
                      duration: "lbl_16_hours_ago".tr,
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
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            "msg_which_place_do_you".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 16.v),
          SizedBox(
            height: 178.v,
            child: Obx(
                  () =>
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 16.h,
                      );
                    },
                    itemCount: controller
                        .pollsScreenModelObj.value.stack1ItemList.value.length,
                    itemBuilder: (context, index) {
                      Stack1ItemModel model = controller
                          .pollsScreenModelObj.value.stack1ItemList
                          .value[index];
                      return Stack1ItemWidget(
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
                height: 41.h,
                width: 99.h,onPressed: () {
                Get.toNamed(AppRoutes.pollDetailsPage);
                },
                text: "lbl_submit".tr,
                buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
              ),
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
  Widget _buildSubmit2() {
    return CustomElevatedButton(
      height: 41.h,
      width: 99.h,onPressed: () {
      Get.toNamed(AppRoutes.pollDetailsPage);
      },
      text: "lbl_submit".tr,
      buttonTextStyle: CustomTextStyles.bodyLargeOnPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnspacer3() {
    final List<TipsList> list = DataFile.brandList;
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
              // Spacer(),
              _buildFollowing2()
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 16.v),
          Text(
            "msg_which_car_brand".tr,
            style: CustomTextStyles.titleMediumBlack90017,
          ),
          SizedBox(height: 16.v),

          ListView.separated(
            shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.selectedValue1.value = index;
                    },
                    child: _buildRowbOne(
                      decoration: controller.selectedValue1.value == index
                          ? AppDecoration.outlinePrimary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12)
                          : AppDecoration.outlineGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12),
                      bOne: list[index].option!.tr,
                      parisFive: list[index].title!.tr,
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) =>
                  SizedBox(
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
          //   parisFive: "lbl_bmw".tr,
          // ),
          SizedBox(height: 24.v),
          Row(
            children: [
              _buildSubmit2(),
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
