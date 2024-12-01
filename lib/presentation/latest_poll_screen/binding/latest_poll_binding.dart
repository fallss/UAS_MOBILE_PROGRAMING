import '../../../core/app_export.dart';
import '../controller/latest_poll_controller.dart';

/// A binding class for the LatestPollScreen.
///
/// This class ensures that the LatestPollController is created when the
/// LatestPollScreen is first loaded.
class LatestPollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LatestPollController());
  }
}
