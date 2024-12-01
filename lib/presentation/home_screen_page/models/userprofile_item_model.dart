// ignore_for_file: duplicate_ignore

import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class UserprofileItemModel {
  UserprofileItemModel({this.userImage, this.biographies, this.id}) {
    userImage = userImage ?? Rx(ImageConstant.imgEllipse16);
    biographies = biographies ?? Rx("Jenny wilson");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? biographies;

  Rx<String>? id;
}
