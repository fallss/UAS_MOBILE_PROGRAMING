// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/home_screen_controller.dart';
import '../models/userprofile_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;
  var controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: .h,
      // padding: EdgeInsets.only(
      //   left: 14.h,
      //   right: 14.h,
      // ),
      child: Column(
        children: [

          CustomImageView(
            imagePath: userprofileItemModelObj.userImage!.value,
            height: 58.adaptSize,
            width: 58.adaptSize,
            radius: BorderRadius.circular(
              29.h,
            ),
                ),
          // Obx(
          //   () => Hero(
          //     tag: ImageConstant.imgEllipse225,
          //     child: Image.asset(
          //       ImageConstant.imgEllipse225,
          //       height: 58.adaptSize,
          //       width: 58.adaptSize,
          //       fit:  BoxFit.cover,
          //
          //     ),
          //
          //     // child: CustomImageView(
          //     //   imagePath: userprofileItemModelObj.userImage!.value,
          //     //   height: 58.adaptSize,
          //     //   width: 58.adaptSize,
          //     //   radius: BorderRadius.circular(
          //     //     29.h,
          //     //   ),
          //     // ),
          //   ),
          // ),
          SizedBox(height: 10.v),
          Expanded(
            child: Obx(
              () => Center(
                child: Text(
                  userprofileItemModelObj.biographies!.value,
                  textAlign: TextAlign.center,

                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  )

                  // CustomTextStyles.bodyMediumBlack900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
