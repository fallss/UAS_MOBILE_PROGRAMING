import 'package:get/get.dart';

import '../../../core/app_export.dart';
import '../models/trending_polls_model.dart';

/// A controller class for the TrendingPollsScreen.
///
/// This class manages the state of the TrendingPollsScreen, including the
/// current trendingPollsModelObj
class TrendingPollsController extends GetxController {
  Rx<TrendingPollsModel> trendingPollsModelObj = TrendingPollsModel().obs;

  Rx<bool> fourPointEightK = false.obs;
  RxInt isSelect = 0.obs;

  Rx<bool> fourpointeightk = false.obs;
}
