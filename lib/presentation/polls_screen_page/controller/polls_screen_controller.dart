import '../../../core/app_export.dart';
import '../models/polls_screen_model.dart';

/// A controller class for the PollsScreenPage.
///
/// This class manages the state of the PollsScreenPage, including the
/// current pollsScreenModelObj
class PollsScreenController extends GetxController {
  PollsScreenController(this.pollsScreenModelObj);

  Rx<PollsScreenModel> pollsScreenModelObj;

  RxInt selectedValue = 0.obs;
  RxInt selectedValue1 = 0.obs;

  Rx<bool> k = false.obs;


  Rx<bool> kone = false.obs;

  Rx<bool> ktwo = false.obs;

  Rx<bool> kthree = false.obs;
}
