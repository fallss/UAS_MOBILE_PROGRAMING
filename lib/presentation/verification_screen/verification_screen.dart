import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/presentation/verification_screen/controller/verification_controller.dart';
import 'package:status/widgets/app_bar/custom_app_bar.dart';
import 'package:status/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  VerificationController controller = Get.put(VerificationController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                Text(
                  'Code sent to ronaldrichards@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Pinput(
                  keyboardType: TextInputType.number,
                  errorText: "Please enter OTP",
                  errorTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.fSize,
                    color: Color(0xFFFF3E3E),
                  ),
                  textInputAction: TextInputAction.done,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  disabledPinTheme: PinTheme(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.fSize,
                        color: appTheme.gray700,
                      ),
                      padding: EdgeInsets.only(left: 9.h, right: 9.h),
                      decoration: BoxDecoration(color: appTheme.gray700)),
                  controller: controller.otpController,
                  length: 6,
                  focusedPinTheme: PinTheme(
                    padding: EdgeInsets.only(left: 8.5.h, right: 8.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.h,
                      ),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                    width: 50.h,
                    height: 50.h,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid code";
                    }
                    if (value.length < 6) {
                      return "Please enter a valid code";
                    }
                    return null;
                  },
                  errorPinTheme: PinTheme(
                    padding: EdgeInsets.only(left: 8.5.h, right: 8.5.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFF3E3E),
                        width: 1.h,
                      ),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    textStyle: TextStyle(
                      color: Color(0xFFFF3E3E),
                      fontSize: 17.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                    width: 52.h,
                    height: 52.h,
                  ),
                  defaultPinTheme: PinTheme(
                    padding: EdgeInsets.only(left: 8.5.h, right: 8.5.h),
                    width: 52.h,
                    height: 52.h,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.fSize,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.h),
                      border: Border.all(
                        color: appTheme.grayBorder,
                        width: 1.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomElevatedButton(
                  text: "Verify",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(AppRoutes.resetPasswordPage);
                    }
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t receive an code? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.fSize,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'resend now',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.fSize,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
        text: "Verification".tr,
      ),
      styleType: Style.bgOutline,
    );
  }
}
