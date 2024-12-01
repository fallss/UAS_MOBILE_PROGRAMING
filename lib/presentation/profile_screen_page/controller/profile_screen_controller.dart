import '../../../core/app_export.dart';
import '../models/profile_screen_model.dart';

/// A controller class for the ProfileScreenPage.
///
/// This class manages the state of the ProfileScreenPage, including the
/// current profileScreenModelObj
class ProfileScreenController extends GetxController {
  ProfileScreenController(this.profileScreenModelObj);

  Rx<ProfileScreenModel> profileScreenModelObj;
}
