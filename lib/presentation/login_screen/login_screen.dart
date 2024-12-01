// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/presentation/login_screen/controller/login_controller.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_filed_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        PrefUtils.closeApp();
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.v),
                  Text(
                    "Log in".tr,
                    style: theme.textTheme.displaySmall!.copyWith(
                      fontSize: 28.fSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Text(
                    'Log in and take your journey to the next level',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.fSize,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: 24.v),
                      CustomTextFormField(
                        label: "Email address".tr,
                        controller: controller.emailController,
                        hintText: "Enter your email address".tr,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          RegExp regExp = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (value!.isEmpty) {
                            return 'Enter email address.';
                          } else {
                            if (!regExp.hasMatch(value)) {
                              return 'Enter valid email address.';
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(height: 30.v),
                      Obx(
                        () => CustomTextFormField(
                          label: "Password".tr,
                          controller: controller.passwordController,
                          hintText: "Enter your password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          suffix: GestureDetector(
                            onTap: () {
                              controller.isShowPassword.value =
                                  !controller.isShowPassword.value;
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
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
                              return "Enter valid password".tr;
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
                        ),
                      ),
                      SizedBox(height: 16.v),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgotPasswordPage);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?".tr,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 48.v),
                      CustomElevatedButton(
                        text: "Log in".tr,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            PrefUtils.setLogin(false);
                            controller.emailController.clear();
                            controller.passwordController.clear();
                            Get.toNamed(AppRoutes.homeScreenContainerScreen);
                          }
                        },
                      ),
                    ],
                  )),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUpPage);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account? ".tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Sign up".tr,
                              style: TextStyle(
                                fontSize: 17.fSize,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w700,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
