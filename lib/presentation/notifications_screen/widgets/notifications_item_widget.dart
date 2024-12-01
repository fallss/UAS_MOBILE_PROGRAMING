
import '../../../core/app_export.dart';
import '../models/notifications_item_model.dart';
import '../controller/notifications_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationsItemWidget extends StatelessWidget {
  NotificationsItemWidget(
    this.notificationsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationsItemModel notificationsItemModelObj;

  var controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        color: appTheme.gray50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
          imagePath: ImageConstant.notification,
            height: 56.h,
            width: 56.h,
        ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 6.v,
                bottom: 4.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      notificationsItemModelObj.notificationsShow!.value,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                        fontSize: 15.fSize,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Obx(
                    () => Text(
                      notificationsItemModelObj.justNow!.value,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: appTheme.gray700,
                        fontSize: 15.fSize,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
