import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
TextEditingController newPasswordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
RxBool isPasswordVisible = true.obs;
RxBool isConfirmPasswordVisible = true.obs;
}