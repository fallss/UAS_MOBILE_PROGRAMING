import '../../../core/app_export.dart';
import '../controller/home_screen_container_controller.dart';

/// A binding class for the HomeScreenContainerScreen.
///
/// This class ensures that the HomeScreenContainerController is created when the
/// HomeScreenContainerScreen is first loaded.
class HomeScreenContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenContainerController());
  }
}
