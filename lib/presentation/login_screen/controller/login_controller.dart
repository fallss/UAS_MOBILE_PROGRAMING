import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // Rx<LogInModel> logInModelObj = LogInModel().obs;

  Rx<bool> isShowPassword = true.obs;
}
