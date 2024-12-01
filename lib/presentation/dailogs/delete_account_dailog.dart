import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/widgets/custom_outlined_button.dart';

import '../../widgets/custom_elevated_button.dart';

class DeleteAccountDailog extends StatelessWidget {
  const DeleteAccountDailog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 30.v,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.h),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.delete_account,
              height: 120.adaptSize,
              width: 120.adaptSize,
              alignment: Alignment.center,
            ),
            SizedBox(height: 28.v),
            Text(
              "Are you sure you want to delete account ?".tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontSize: 24.fSize,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            // SizedBox(height: 8.v),
            // Text(
            //   "You have successfully change your password use new password to log in ".tr,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            //   textAlign: TextAlign.center,
            //   style: theme.textTheme.bodyLarge!.copyWith(
            //     height: 1.3,
            //   ),
            // ),
            SizedBox(height: 28.v),
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
                    text: "No".tr,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    width: double.infinity,
                    height: 56.h,
                    text: "Yes  ".tr,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
