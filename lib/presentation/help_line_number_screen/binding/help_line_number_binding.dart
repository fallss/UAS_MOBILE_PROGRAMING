import 'package:status/presentation/help_line_number_screen/controller/help_line_number_controller.dart';
import 'package:get/get.dart';

class HelpLineNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpLineNumberController());
  }
}
