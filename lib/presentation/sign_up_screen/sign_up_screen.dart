import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/presentation/sign_up_screen/controller/sign_up_controller.dart';

import '../../widgets/coustom_country_picker.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_filed_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.v),
                Text(
                  "Sign up".tr,
                  style: theme.textTheme.displaySmall!.copyWith(
                    fontSize: 28.fSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.v),
                Text(
                  'Sign up and begin your journey to the next level',
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
                    _buildName(),
                    SizedBox(height: 16.v),
                    _buildUserName(),
                    SizedBox(height: 16.v),
                    _buildEmail(),
                    SizedBox(height: 16.v),
                    _buildNumber(),
                    SizedBox(height: 16.v),
                    _buildPassword(),
                    SizedBox(height: 16.v),
                    Row(
                      children: [
                        Obx(() {
                          return CustomImageView(
                            height: 24.v,
                            width: 24.v,
                            onTap: () {
                              controller.isSelect.value =
                                  !controller.isSelect.value;
                            },
                            imagePath: controller.isSelect.value
                                ? ImageConstant.checkBox_selected
                                : ImageConstant.checkBox_unseelct,
                          );
                        }),
                        SizedBox(width: 10.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree with ".tr,
                                style: TextStyle(
                                  fontSize: 17.fSize,
                                  color: Colors.black,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: "Terms and Privacy".tr,
                                style: TextStyle(
                                  fontSize: 16.fSize,
                                  color: theme.colorScheme.primary,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.v),
                    _buildSignUp(),
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ".tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.fSize,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Sign in".tr,
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
                SizedBox(height: 40.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildName() {
    return CustomTextFormField(
      controller: controller.nameController,
      hintText: "Enter your full name".tr,
      label: "Full name".tr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your full name".tr;
        }
        // if (!isText(value)) {
        //   return "err_msg_please_enter_valid_text".tr;
        // }
        return null;
      },
    );
  }

  Widget _buildUserName() {
    return CustomTextFormField(
      controller: controller.userNameController,
      hintText: "Enter your username".tr,
      label: "Username".tr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your username".tr;
        }
        // if (!isText(value)) {
        //   return "err_msg_please_enter_valid_text".tr;
        // }
        return null;
      },
    );
  }

  Widget _buildNumber() {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      controller: controller.phoneNumberController,
      hintText: "Enter your phone number".tr,
      label: "Phone number".tr,
      prefixConstraints: BoxConstraints(maxHeight: 54.h),
      prefix: CustomCountryCodePicker(
        onChanged: (value) {
          controller.changeCountry(value.name!, value.dialCode!, context);
        },
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        dialogTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 17.fSize,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        initialSelection: 'IND',
        favorite: ['+62', 'IND'],
        showCountryOnly: false,
        enabled: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
        showFlag: false,
        showDropDownButton: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your phone number".tr;
        }
        // if (!isText(value)) {
        //   return "err_msg_please_enter_valid_text".tr;
        // }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "Enter your email address".tr,
      label: "Email".tr,
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
    );
  }

  /// Section Widget
  Widget _buildPassword() {
    return Obx(
      () => CustomTextFormField(
        label: "Password".tr,
        controller: controller.passwordController,
        hintText: "Enter your password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        suffix: GestureDetector(
          onTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
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
          // if (value == null || (!isValidPassword(value, isRequired: true))) {
          //   return "err_msg_please_enter_valid_password".tr;
          // }
          // return null;
          if (value == null || value.isEmpty) {
            return "Enter valid password".tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value,
        contentPadding: EdgeInsets.only(
          left: 16.h,
          top: 14.v,
          bottom: 14.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUp() {
    return CustomElevatedButton(
      text: "Sign up".tr,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          PrefUtils.setLogin(false);
          Get.toNamed(AppRoutes.homeScreenContainerScreen);
          controller.nameController.clear();
          controller.emailController.clear();
          controller.passwordController.clear();
          controller.userNameController.clear();
          controller.phoneNumberController.clear();
        }
      },
    );
  }
}
