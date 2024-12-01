import 'package:status/core/app_export.dart';

import '../../core/data_file/data_file.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/notifications_item_widget.dart';
import 'models/notifications_item_model.dart';
import 'package:flutter/material.dart';
import 'controller/notifications_controller.dart';

class NotificationsScreen extends GetWidget<NotificationController> {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
            padding: EdgeInsets.only(left: 20.h, right: 20.h),
            child: controller.notificationsModelObj.value.notificationsItemList
                    .value.isNotEmpty
                ? Obx(() => ListView.separated(
                    padding: EdgeInsets.only(bottom: 24.v, top: 24.v),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.v);
                    },
                    itemCount: controller.notificationsModelObj.value
                        .notificationsItemList.value.length,
                    itemBuilder: (context, index) {
                      NotificationsItemModel model = controller
                          .notificationsModelObj
                          .value
                          .notificationsItemList
                          .value[index];
                      return animationFunction(
                          index, NotificationsItemWidget(model));
                    }))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                            height: 124.adaptSize,
                            width: 124.adaptSize,
                            padding: EdgeInsets.symmetric(
                                horizontal: 39.h, vertical: 37.v),
                            decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder16),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgEllipse241,
                                height: 48.v,
                                width: 43.h,
                                alignment: Alignment.center)),
                        SizedBox(height: 27.v),
                        Text("msg_no_notifications".tr,
                            style: theme.textTheme.headlineSmall),
                        SizedBox(height: 14.v),
                        SizedBox(
                            width: 253.h,
                            child: Text("msg_we_did_not_found".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.41))),
                        SizedBox(height: 5.v)
                      ])));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.back,
            margin: EdgeInsets.only(left: 20.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarTitle(
            text: "Notifications".tr, margin: EdgeInsets.only(left: 16.h)),
        styleType: Style.bgOutline);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
