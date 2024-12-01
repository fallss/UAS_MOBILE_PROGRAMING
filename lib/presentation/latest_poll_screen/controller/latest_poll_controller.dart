import '../../../core/app_export.dart';
import '../models/latest_poll_model.dart';

/// A controller class for the LatestPollScreen.
///
/// This class manages the state of the LatestPollScreen, including the
/// current latestPollModelObj
class LatestPollController extends GetxController {
  Rx<LatestPollModel> latestPollModelObj = LatestPollModel().obs;
  RxInt currentIndex = 0.obs;
  RxInt currentIndex1 = 0.obs;


  Rx<bool> k = false.obs;

  Rx<bool> kone = false.obs;

  Rx<bool> ktwo = false.obs;

  Rx<bool> kthree = false.obs;
}
