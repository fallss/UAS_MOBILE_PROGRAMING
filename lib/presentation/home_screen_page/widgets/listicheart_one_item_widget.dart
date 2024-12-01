// ignore_for_file: duplicate_ignore

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../controller/home_screen_controller.dart';
import '../models/listicheart_one_item_model.dart'; // ignore: must_be_immutable
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ListicheartOneItemWidget extends StatelessWidget {
  ListicheartOneItemWidget(this.listicheartOneItemModelObj, {Key? key})
      : super(
          key: key,
        );

  ListicheartOneItemModel listicheartOneItemModelObj;

  var controller = Get.find<HomeScreenController>();

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
              imagePath: listicheartOneItemModelObj.image!.value,
              height: 178.v,
              width: 174.h,
              radius: BorderRadius.circular(
                12.h,
              ),
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              bottom: 12.v,
            ),
            child: Obx(
              () => CustomIconButton(
                height: 32.adaptSize,
                width: 32.adaptSize,
                padding: EdgeInsets.all(6.h),
                alignment: Alignment.bottomLeft,
                child: CustomImageView(
                  imagePath: listicheartOneItemModelObj.icheartone!.value,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
