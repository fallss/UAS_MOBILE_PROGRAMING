import '../../../core/app_export.dart';
import '../models/log_out_popup_model.dart';

/// A controller class for the LogOutPopupDialog.
///
/// This class manages the state of the LogOutPopupDialog, including the
/// current logOutPopupModelObj
class LogOutPopupController extends GetxController {
  Rx<LogOutPopupModel> logOutPopupModelObj = LogOutPopupModel().obs;
}
