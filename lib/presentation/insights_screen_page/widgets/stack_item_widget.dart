import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/insights_screen_controller.dart';
import '../models/stack_item_model.dart';
// ignore_for_file: must_be_immutable

class StackItemWidget extends StatelessWidget {
  StackItemWidget(this.stackItemModelObj, {Key? key})
      : super(
          key: key,
        );

  StackItemModel stackItemModelObj;

  var controller = Get.find<InsightsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Obx(
              () => CustomImageView(
            imagePath: stackItemModelObj.image!.value,
            height: 178.v,
            width: 174.h,
            radius: BorderRadius.circular(
              12.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 12.h, bottom: 12.v),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 32.adaptSize,
              height: 32.adaptSize,
              // margin: EdgeInsets.only(
              //   left: 12.h,
              //   bottom: 12.v,
              // ),
              // padding: EdgeInsets.symmetric(
              //   horizontal: 4.h,
              //   vertical: 8.v,
              // ),
              decoration: AppDecoration.fillOnPrimary.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder16,
              ),
              child: Obx(
                    () => Center(
                  child: Text(
                    stackItemModelObj.text!.value,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
