import 'package:get/get.dart';

import '../controller/terms_conditions_controller.dart';

/// A binding class for the TermsConditionsScreen.
///
/// This class ensures that the TermsConditionsController is created when the
/// TermsConditionsScreen is first loaded.
class TermsConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsConditionsController());
  }
}
