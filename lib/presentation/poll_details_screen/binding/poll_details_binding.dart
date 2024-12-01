import '../../../core/app_export.dart';
import '../controller/poll_details_controller.dart';

/// A binding class for the InsightsResultImageScreen.
///
/// This class ensures that the InsightsResultImageController is created when the
/// InsightsResultImageScreen is first loaded.
class PollDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PollDetailsController());
  }
}
