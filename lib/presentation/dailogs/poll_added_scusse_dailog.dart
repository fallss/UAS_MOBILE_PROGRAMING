import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/widgets/custom_elevated_button.dart';

import '../../widgets/custom_bottom_bar.dart';
import '../add_new_poll_answer_screen_page/controller/add_new_poll_answer_screen_controller.dart';

class PollAddedSuccess extends StatelessWidget {
  const PollAddedSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomBottomBarController bottomBarController = Get.find();

    AddNewPollAnswerScreenController controller = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.h),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 31.h, horizontal: 19.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                width: 120.h,
                height: 120.h,
                imagePath: ImageConstant.success,
              ),
              SizedBox(height: 28.h),
              Text(
                'Polls added success',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 13.h),
              Text(
                'thank you for add poll success. go to home to continue your journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.fSize,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 28.h),
              CustomElevatedButton(
                text: "Go to home",
                onPressed: () {
                  controller.isVisible.value = false;
                  controller.isVisibleImage.value = false;
                  controller.isVisibleVoting.value = false;
                  Get.back();
                  bottomBarController.getIndex(0);
                  controller.update();
                  // Get.toNamed(AppRoutes.homeScreenPage);
                },
                margin: EdgeInsets.symmetric(horizontal: 54.h),
              )
            ],
          ),
        ),
      ),
    );
  }
}
