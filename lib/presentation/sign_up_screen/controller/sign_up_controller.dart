import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:status/firebase_auth_implementation/firebase_auth_services.dart';

class SignUpController extends GetxController {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool isSigningUp = false;

  //dispose
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  // Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  RxString code = "+62".obs;
  RxString country = "Indonesia".obs;

  changeCountry(String value, String value1, BuildContext context) {
    country.value = value;
    code.value = value1;
    update();
  }

  Rx<bool> isShowPassword = true.obs;
  RxBool isSelect = false.obs;

  void signUp(BuildContext context) async {
    isSigningUp = true;
    update();

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user == null) {
      print("Some error happened");
    } else {
      print("User is successfully created");
    }

    isSigningUp = false;
    update();
  }
}
