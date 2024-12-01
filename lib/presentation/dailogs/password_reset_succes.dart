import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

import '../../widgets/custom_elevated_button.dart';

class PasswordResetSuccess extends StatelessWidget {
  const PasswordResetSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 36.v,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.resetSuccess,
              height: 120.adaptSize,
              width: 120.adaptSize,
              alignment: Alignment.center,
            ),
            SizedBox(height: 34.v),
            Text(
              "Password reset success".tr,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 8.v),
            Text(
              "You have successfully change your password use new password to log in "
                  .tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!.copyWith(
                height: 1.3,
              ),
            ),
            SizedBox(height: 32.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 54.0.h),
              child: CustomElevatedButton(
                width: double.infinity,
                height: 50.h,
                text: "Go to login".tr,
                onPressed: () {
                  Get.toNamed(AppRoutes.loginPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
