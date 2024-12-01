import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/terms_conditions_controller.dart';

class TermsConditionsScreen extends GetWidget<TermsConditionsController> {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 0.v),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1. Agreement of terms".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 16.v),
                    Text("lbl_terms1".tr,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
                            height: 1.4,
                            fontSize: 17.fSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(height: 24.v),
                    Text("2. Terms of services".tr,
                        style: CustomTextStyles.titleLargeOnPrimary.copyWith(
                          color: Colors.black,
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 16.v),
                    Text("lbl_terms2".tr,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
                            height: 1.4,
                            fontSize: 17.fSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    SizedBox(height: 24.v),
                    Text("3. Condition of use ".tr,
                        style: CustomTextStyles.titleLargeOnPrimary.copyWith(
                          color: Colors.black,
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: 16.v),
                    Text("lbl_terms3".tr,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeOnPrimary.copyWith(
                            height: 1.4,
                            fontSize: 17.fSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ]),
            ),
          ),
        ));
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
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: AppbarTitle(text: "Terms & condition".tr),
        ),
        styleType: Style.bgOutline);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
