// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/polls_screen_controller.dart';
import '../models/stack1_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class Stack1ItemWidget extends StatelessWidget {
  Stack1ItemWidget(this.stack1ItemModelObj, {Key? key})
      : super(
          key: key,
        );

  Stack1ItemModel stack1ItemModelObj;

  var controller = Get.find<PollsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Obx(
          () => CustomImageView(
            imagePath: stack1ItemModelObj.image!.value,
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
                    stack1ItemModelObj.text!.value,
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
