import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/poll_details_controller.dart';
import '../models/userprofile_item_model.dart';
// ignore_for_file: must_be_immutable

class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<PollDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: userprofileItemModelObj.userImage!.value,
              height: 58.adaptSize,
              width: 58.adaptSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              // top: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    userprofileItemModelObj.username!.value,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 18.fSize,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Obx(
                  () => Text(
                    userprofileItemModelObj.timeAgo!.value,
                    style: CustomTextStyles.bodyMediumBlack900.copyWith(
                      color: appTheme.gray700,
                      fontSize: 15.fSize,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 4.h),
            padding: EdgeInsets.symmetric(
              horizontal: 21.h,
              vertical: 13.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder29,
            ),
            child: Obx(
              () => Text(
                userprofileItemModelObj.letter!.value,
                style: theme.textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontSize: 24.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
