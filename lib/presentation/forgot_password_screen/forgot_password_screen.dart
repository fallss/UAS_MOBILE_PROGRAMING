import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/presentation/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:status/widgets/custom_elevated_button.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_filed_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Form(
            key: _formKey,
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
                _buildEmail(),
                SizedBox(
                  height: 30.h,
                ),
                CustomElevatedButton(
                  text: "Send".tr,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(AppRoutes.verificationPage);
                      // controller.sendEmail();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return CustomTextFormField(
      controller: controller.emailController,
      hintText: "Enter your email address".tr,
      label: "Email address".tr,
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

  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      centerTitle: true,
      // onBackPress: () {
      //   Get.
      //   back();
      // },

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
        text: "Forgot password".tr,
      ),
      // leading: Column(
      //   children: [
      //     Container(
      //       height: 40.h,
      //       width: 40.h,
      //       decoration:BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: appTheme.gray50,
      //
      //       ),
      //       child: Center(
      //         child: CustomImageView(
      //           imagePath: ImageConstant.back,
      //           height: 24.adaptSize,
      //           width: 24.adaptSize,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      styleType: Style.bgOutline,
    );
  }
}
