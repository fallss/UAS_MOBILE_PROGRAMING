import '../../../core/app_export.dart';
import '../models/insights_screen_model.dart';

/// A controller class for the InsightsScreenPage.
///
/// This class manages the state of the InsightsScreenPage, including the
/// current insightsScreenModelObj
class InsightsScreenController extends GetxController {
  InsightsScreenController(this.insightsScreenModelObj);

  Rx<InsightsScreenModel> insightsScreenModelObj;

  RxInt selectIndex = 0.obs;
  RxInt selectIndex1 = 0.obs;

  Rx<bool> k = false.obs;

  Rx<bool> kone = false.obs;

  Rx<bool> ktwo = false.obs;

  Rx<bool> kthree = false.obs;
}
