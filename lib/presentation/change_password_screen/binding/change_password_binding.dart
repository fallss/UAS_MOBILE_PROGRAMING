import 'package:get/get.dart';

import '../controller/chanege_password_controler.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
