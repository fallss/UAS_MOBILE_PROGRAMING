// ignore_for_file: duplicate_ignore

import '../../../core/app_export.dart';
import 'listicheart_one_item_model.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [home_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomeScreenModel {
  Rx<List<ListicheartOneItemModel>> listicheartOneItemList = Rx([
    ListicheartOneItemModel(
        image: ImageConstant.imgRectangle384.obs,
        icheartone: ImageConstant.imgIcHeart.obs),
    ListicheartOneItemModel(
        image: ImageConstant.imgRectangle384178x174.obs,
        icheartone: ImageConstant.imgIcHeartBlack900.obs)
  ]);

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse16.obs,
        biographies: "Jenny wilson".obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse1658x58.obs,
        biographies: "Robert fox".obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse161.obs,
        biographies: "John smith".obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgEllipse162.obs,
        biographies: "Oliver green".obs)
  ]);
}
