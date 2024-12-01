import 'package:get/get.dart';

import '../controller/notifications_controller.dart';

/// A binding class for the NotificationsScreen.
///
/// This class ensures that the NotificationsController is created when the
/// NotificationsScreen is first loaded.
class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
