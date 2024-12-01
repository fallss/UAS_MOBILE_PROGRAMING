// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/latest_poll_controller.dart';
import '../models/stack_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class StackItemWidget extends StatelessWidget {
  StackItemWidget(this.stackItemModelObj, {Key? key})
      : super(
          key: key,
        );

  StackItemModel stackItemModelObj;

  var controller = Get.find<LatestPollController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 178.v,
      width: 174.h,
      child: Stack(
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 31.h,
              height: 32.h,
              margin: EdgeInsets.only(
                left: 12.h,
                bottom: 12.v,
              ),
              // padding: EdgeInsets.symmetric(
              //   horizontal: 4.h,
              //   vermtical: 8.v,
              // ),
              decoration:ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
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
          )
        ],
      ),
    );
  }
}
