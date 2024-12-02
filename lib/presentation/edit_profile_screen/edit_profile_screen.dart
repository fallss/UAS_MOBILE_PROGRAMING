import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/widgets/custom_text_filed_widget.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/coustom_country_picker.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/edit_profile_controller.dart'; // ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  EditProfileScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse225,
                        height: 108.adaptSize,
                        width: 108.adaptSize,
                      ),
                      Container(
                          height: 34.h,
                          width: 34.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appTheme.gray50,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 16,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.camera,
                              height: 20.78.h,
                              width: 20.78.h,
                            ),
                          ))
                    ],
                  ),
                ),
                // SizedBox(height: 18.v),
                // Center(
                //   child: Text(
                //     "msg_leslie_alexander".tr,
                //     style: CustomTextStyles.titleMediumBlack900,
                //   ),
                // ),
                // SizedBox(height: 4.v),
                // Center(
                //   child: Text(
                //     "msg_lesliealexander_gmail_com".tr,
                //     style: CustomTextStyles.bodyLargePrimary,
                //   ),
                // ),
                SizedBox(height: 34.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                  child: _buildName(),
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                  child: _buildEmail(),
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                  child: _buildPhoneNumber(context),
                ),
              ],
            )),
            _buildSaveProfile(),
            // SizedBox(height: 5.v)
          ],
        ),
      ),
      // bottomNavigationBar: _buildSaveProfile(),
    );
  }

  /// Section Widget
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
            onTapArrowLeft();
          },
        ),
        centerTitle: true,
        title: Text(
          'Edit profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.fSize,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w700,
          ),
        ));
  }

  /// Section Widget
  Widget _buildName() {
    return CustomTextFormField(
      controller: controller.nameController,
      label: "Full name".tr,
      // labelStyle: theme.textTheme.bodyLarge!,
      hintText: "Full name".tr,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter full name".tr;
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
      label: "Email address".tr,
      // labelStyle: theme.textTheme.bodyLarge!,
      hintText: "Email address".tr,
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
        // if (value == null || (!isValidEmail(value, isRequired: true))) {
        //   return "err_msg_please_enter_valid_email".tr;
        // }
        // return null;
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomTextFormField(
      controller: controller.phoneNumberController,
      label: "Phone number".tr,
      // labelStyle: theme.textTheme.bodyLarge!,
      hintText: "Phone number".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.phone,
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
        // if (!isValidPhone(value)) {
        //   return "err_msg_please_enter_valid_phone_number".tr;
        // }
        if (value == null || value.isEmpty) {
          return "Please enter phone number".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildSaveProfile() {
    return CustomElevatedButton(
      text: "Save".tr,
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 38.v,
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.back();
        }
      },
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
