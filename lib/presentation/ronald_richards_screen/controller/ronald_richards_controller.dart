import '../../../core/app_export.dart';
import '../models/ronald_richards_model.dart';

/// A controller class for the RonaldRichardsScreen.
///
/// This class manages the state of the RonaldRichardsScreen, including the
/// current ronaldRichardsModelObj
class RonaldRichardsController extends GetxController {
  Rx<RonaldRichardsModel> ronaldRichardsModelObj = RonaldRichardsModel().obs;

  Rx<bool> fourPointEightK = false.obs;

  Rx<bool> fourpointeightk = false.obs;
  RxInt selectedValue = 0.obs;
}
