import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_filed_widget.dart';
import 'controller/chanege_password_controler.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ChangePasswordController controller = Get.put(ChangePasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 0.h),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: GetBuilder<ChangePasswordController>(
                      init: ChangePasswordController(),
                      builder: (controller) {
                        return Column(
                          children: [
                            Text(
                              "Change your password today it's time to take back control of your online security"
                                  .tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            CustomTextFormField(
                              controller: controller.newPasswordController,
                              label: "New Password".tr,
                              hintText: "New Password",
                              obscureText: controller.isPasswordVisible.value,
                              suffix: GestureDetector(
                                onTap: () {
                                  controller.isPasswordVisible.value =
                                      !controller.isPasswordVisible.value;
                                  controller.update();
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 13.v, 16.h, 13.v),
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
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                              textInputAction: TextInputAction.done,
                              controller: controller.confirmPasswordController,
                              label: "Confirm Password".tr,
                              hintText: "Confirm Password",
                              obscureText:
                                  controller.isConfirmPasswordVisible.value,
                              suffix: GestureDetector(
                                onTap: () {
                                  controller.isConfirmPasswordVisible.value =
                                      !controller
                                          .isConfirmPasswordVisible.value;
                                  controller.update();
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 13.v, 16.h, 13.v),
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
                            ),
                            // SizedBox(height: 48.h,),
                          ],
                        );
                      },
                    ),
                  ),
                  CustomElevatedButton(
                    text: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.back();
                      }
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
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
      centerTitle: true,
      title: AppbarTitle(
        text: "Change password".tr,
      ),
      styleType: Style.bgOutline,
    );
  }
}
