import '../../../core/app_export.dart';
import '../models/home_screen_model.dart';

/// A controller class for the HomeScreenPage.
///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
  HomeScreenController(this.homeScreenModelObj);

  Rx<HomeScreenModel> homeScreenModelObj;
  RxInt currentIndex = 0.obs;
  RxInt currentIndex1 = 0.obs;

  Rx<bool> k = false.obs;

  Rx<bool> kone = false.obs;

  Rx<bool> ktwo = false.obs;
}
