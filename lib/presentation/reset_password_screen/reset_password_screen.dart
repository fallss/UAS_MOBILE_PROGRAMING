import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/presentation/reset_password_screen/controller/reset_password_controller.dart';
import 'package:status/widgets/custom_elevated_button.dart';
import 'package:status/widgets/custom_text_filed_widget.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../dailogs/password_reset_succes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController controller = Get.put(ResetPasswordController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Text(
                  'Enter your email for the verification process. we will send 6 digits code to your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Obx(() {
                return CustomTextFormField(
                  label: "New password".tr,
                  controller: controller.passwordController,
                  hintText: "Enter your new password".tr,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.visiblePassword,
                  suffix: GestureDetector(
                    onTap: () {
                      controller.isShowPassword.value =
                          !controller.isShowPassword.value;
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.eye_off,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter valid new password".tr;
                    }
                    // if (value == null ||
                    //     (!isValidPassword(value, isRequired: true))) {
                    //   return "err_msg_please_enter_valid_password".tr;
                    // }
                    return null;
                  },
                  obscureText: controller.isShowPassword.value,
                  contentPadding: EdgeInsets.only(
                    left: 16.h,
                    top: 14.v,
                    bottom: 14.v,
                  ),
                );
              }),
              SizedBox(
                height: 16.h,
              ),
              Obx(() {
                return CustomTextFormField(
                  label: "Confirm password".tr,
                  controller: controller.confirmPasswordController,
                  hintText: "Enter your confirm password".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: GestureDetector(
                    onTap: () {
                      controller.isShowConfirmPassword.value =
                          !controller.isShowConfirmPassword.value;
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
                      child: CustomImageView(
                        imagePath: ImageConstant.eye_off,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 50.v,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter valid confirm password".tr;
                    }
                    // if (value == null ||
                    //     (!isValidPassword(value, isRequired: true))) {
                    //   return "err_msg_please_enter_valid_password".tr;
                    // }
                    return null;
                  },
                  obscureText: controller.isShowConfirmPassword.value,
                  contentPadding: EdgeInsets.only(
                    left: 16.h,
                    top: 14.v,
                    bottom: 14.v,
                  ),
                );
              }),
              SizedBox(
                height: 30.h,
              ),
              CustomElevatedButton(
                text: "Reset password".tr,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.dialog(AlertDialog(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      contentPadding: EdgeInsets.zero,
                      actionsPadding: EdgeInsets.zero,
                      insetPadding: EdgeInsets.symmetric(horizontal: 0.h),
                      content: PasswordResetSuccess(),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      centerTitle: true,
      leadingWidth: 58.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.back,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 18.v,
          bottom: 18.v,
        ),
        onTap: () {
          Get.back();
        },
      ),
      title: AppbarTitle(
        text: "Reset password".tr,
      ),
      styleType: Style.bgOutline,
    );
  }
}
