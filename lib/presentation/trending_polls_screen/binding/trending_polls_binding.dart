import '../../../core/app_export.dart';
import '../controller/trending_polls_controller.dart';

/// A binding class for the TrendingPollsScreen.
///
/// This class ensures that the TrendingPollsController is created when the
/// TrendingPollsScreen is first loaded.
class TrendingPollsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrendingPollsController());
  }
}
