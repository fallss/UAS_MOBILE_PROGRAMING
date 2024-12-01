import '../../../core/app_export.dart';
import '../controller/popular_creators_controller.dart';

/// A binding class for the PopularCreatorsScreen.
///
/// This class ensures that the PopularCreatorsController is created when the
/// PopularCreatorsScreen is first loaded.
class PopularCreatorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PopularCreatorsController());
  }
}
