import '../../../core/app_export.dart';
import '../models/edit_profile_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController(text: "Ronald richards");

  TextEditingController emailController = TextEditingController(text: "ronaldrichards@gmail.com");

  TextEditingController phoneNumberController = TextEditingController(text: "(405) 555-0128");

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  RxString code = "+91".obs;
  RxString country = "India".obs;

  changeCountry(String value, String value1, BuildContext context) {
    country.value = value;
    code.value = value1;
    update();
  }
  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
  }
}
