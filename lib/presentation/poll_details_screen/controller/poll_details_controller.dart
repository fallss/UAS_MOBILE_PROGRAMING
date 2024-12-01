import '../../../core/app_export.dart';
import '../models/poll_details_model.dart';

/// A controller class for the InsightsResultImageScreen.
///
/// This class manages the state of the InsightsResultImageScreen, including the
/// current insightsResultImageModelObj
class PollDetailsController extends GetxController {
  Rx<PollDetailsModel> insightsResultImageModelObj =
      PollDetailsModel().obs;
}
