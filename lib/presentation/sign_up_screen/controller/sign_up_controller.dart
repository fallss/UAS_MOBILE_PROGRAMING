import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  RxString code = "+91".obs;
  RxString country = "India".obs;

  changeCountry(String value, String value1, BuildContext context) {
    country.value = value;
    code.value = value1;
    update();
  }

  Rx<bool> isShowPassword = true.obs;
  RxBool isSelect = false.obs;
}
