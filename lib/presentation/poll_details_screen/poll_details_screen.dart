// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:status/core/data_file/data_file.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/poll_details_controller.dart';
import 'models/userprofile_item_model.dart';
import 'widgets/userprofile_item_widget.dart'; // ignore_for_file: must_be_immutable

class PollDetailsScreen extends GetWidget<PollDetailsController> {
  const PollDetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16.v, bottom: 16.v),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColumnquestion(),
                SizedBox(height: 16.v),
                Text(
                  "All votes".tr,
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 18.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.v),
                _buildUserprofile()
              ],
            ),
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
        onTap: () {
          Get.back();
        },
        margin: EdgeInsets.only(
          left: 16.h,
          top: 21.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Poll details".tr,
      ),
      styleType: Style.bgOutline,
    );
  }

  /// Section Widget
  Widget _buildColumnquestion() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Question".tr,
            style: CustomTextStyles.bodyMediumBlack900.copyWith(
              fontSize: 14.fSize,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.v),
          Text(
            "Which bike do you like?".tr,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: 18.fSize,
              color: Colors.black,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadiusStyle.circleBorder25,
                ),
                child: Text(
                  "A".tr,
                  style: CustomTextStyles.titleLargeOnPrimary.copyWith(
                    color: Colors.white,
                    fontSize: 20.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 3.v,
                    bottom: 4.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRowvotesOne(
                        votesCounter: "38 Votes".tr,
                        votesOne: "56%".tr,
                      ),
                      SizedBox(height: 8.v),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        width: 245, backgroundColor: appTheme.gray100,
                        animation: true, barRadius: Radius.circular(4.h),
                        animationDuration: 2500,
                        lineHeight: 15.0,
                        // leading: new Text("left content"),
                        // trailing: new Text("right content"),
                        percent: 0.56,
                        // center: Text("20.0%"),
                        // ignore: duplicate_ignore
                        // ignore: deprecated_member_use
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: theme.colorScheme.primary,
                      ),
                      // Container(
                      //   height: 15.v,
                      //   width: 296.h,
                      //   decoration: BoxDecoration(
                      //     color: appTheme.gray100,
                      //     borderRadius: BorderRadius.circular(
                      //       4.h,
                      //     ),
                      //   ),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(
                      //       4.h,
                      //     ),
                      //     child: LinearProgressIndicator(
                      //       value: 0.48,
                      //       backgroundColor: appTheme.gray100,
                      //       valueColor: AlwaysStoppedAnimation<Color>(
                      //         theme.colorScheme.primary,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16.v),
          Divider(),
          SizedBox(height: 16.v),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadiusStyle.circleBorder25,
                ),
                child: Text(
                  "B".tr,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 20.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 3.v,
                    bottom: 4.v,
                  ),
                  child: Column(
                    children: [
                      _buildRowvotesOne(
                        votesCounter: "40 Votes".tr,
                        votesOne: "65%".tr,
                      ),
                      SizedBox(height: 8.v),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        width: 245, backgroundColor: appTheme.gray100,
                        animation: true, barRadius: Radius.circular(4.h),
                        animationDuration: 2500,
                        lineHeight: 15.0,
                        // leading: new Text("left content"),
                        // trailing: new Text("right content"),
                        percent: 0.65,
                        // center: Text("20.0%"),
                        // ignore: duplicate_ignore
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Color(0xFFDCDCDC),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16.v),
          Divider(),
          SizedBox(height: 16.v),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadiusStyle.circleBorder25,
                ),
                child: Text(
                  "C".tr,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 20.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 3.v,
                    bottom: 4.v,
                  ),
                  child: Column(
                    children: [
                      _buildRowvotesOne(
                        votesCounter: "58 Votes".tr,
                        votesOne: "80%".tr,
                      ),
                      SizedBox(height: 8.v),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        width: 245, backgroundColor: appTheme.gray100,
                        animation: true, barRadius: Radius.circular(4.h),
                        animationDuration: 2500,
                        lineHeight: 15.0,
                        // leading: new Text("left content"),
                        // trailing: new Text("right content"),
                        percent: 0.80,
                        // center: Text("20.0%"),
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Color(0xFFDCDCDC),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16.v),
          Divider(),
          SizedBox(height: 16.v),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.fillGray.copyWith(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadiusStyle.circleBorder25,
                ),
                child: Text(
                  "D".tr,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 20.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    top: 3.v,
                    bottom: 4.v,
                  ),
                  child: Column(
                    children: [
                      _buildRowvotesOne(
                        votesCounter: "18 Votes".tr,
                        votesOne: "25%".tr,
                      ),
                      SizedBox(height: 8.v),
                      LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        width: 245, backgroundColor: appTheme.gray100,
                        animation: true, barRadius: Radius.circular(4.h),
                        animationDuration: 2500,
                        lineHeight: 15.0,
                        // leading: new Text("left content"),
                        // trailing: new Text("right content"),
                        percent: 0.25,
                        // center: Text("20.0%"),
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Color(0xFFDCDCDC),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16.v),
          Text(
            "125 Total Votes".tr,
            style: CustomTextStyles.bodyMediumBlack900.copyWith(
              color: appTheme.gray700,
              fontSize: 15.fSize,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserprofile() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16.v,
          );
        },
        itemCount: controller
            .insightsResultImageModelObj.value.userprofileItemList.value.length,
        itemBuilder: (context, index) {
          UserprofileItemModel model = controller.insightsResultImageModelObj
              .value.userprofileItemList.value[index];
          return animationFunction(
              index,
              UserprofileItemWidget(
                model,
              ));
        },
      ),
    );
  }

  /// Common widget
  Widget _buildRowvotesOne({
    required String votesCounter,
    required String votesOne,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          votesCounter,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
        Text(
          votesOne,
          style: CustomTextStyles.bodyLargePrimary.copyWith(
            color: appTheme.gray700,
          ),
        )
      ],
    );
  }
}
