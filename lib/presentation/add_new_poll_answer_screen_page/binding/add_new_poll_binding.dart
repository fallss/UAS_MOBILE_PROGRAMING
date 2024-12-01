import 'package:get/get.dart';

import '../controller/add_new_poll_answer_screen_controller.dart';

class AddNewPollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewPollAnswerScreenController());
  }
}
