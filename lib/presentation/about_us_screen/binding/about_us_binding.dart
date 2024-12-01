import 'package:get/get.dart';

import '../controller/about_up_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutUsController());
  }
}
