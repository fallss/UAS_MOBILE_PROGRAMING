import '../../../core/app_export.dart';
import '../controller/ronald_richards_controller.dart';

/// A binding class for the RonaldRichardsScreen.
///
/// This class ensures that the RonaldRichardsController is created when the
/// RonaldRichardsScreen is first loaded.
class RonaldRichardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RonaldRichardsController());
  }
}
