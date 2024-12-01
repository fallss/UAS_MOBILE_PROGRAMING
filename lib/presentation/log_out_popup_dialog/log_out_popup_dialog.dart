import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/log_out_popup_controller.dart';

// ignore: must_be_immutable
class LogOutPopupDialog extends StatelessWidget {
  LogOutPopupDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  LogOutPopupController controller;
  CustomBottomBarController bottomBarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.h),
      child: Container(
        width: 388.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 24.v,
        ),
        decoration: AppDecoration.fillOnPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.v),
            Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.fSize,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24.v),
            Row(
              children: [
                Expanded(
                  child: CustomOutlinedButton(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.h),
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 1.50.h,
                      ),
                    ),
                    height: 56.h,
                    text: "Cancel".tr,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                SizedBox(
                  width: 16.h,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      PrefUtils.setLogin(true);
                      Get.toNamed(
                        AppRoutes.loginPage,
                      );
                      bottomBarController.selectedIndex.value = 0;
                      bottomBarController.getIndex(0);
                      controller.update();
                    },
                    text: "Log out".tr,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
