import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
// ignore_for_file: must_be_immutable

class UserprofileItemModel {
  UserprofileItemModel(
      {this.userImage, this.username, this.timeAgo, this.letter, this.id}) {
    userImage = userImage ?? Rx(ImageConstant.imgEllipse241);
    username = username ?? Rx("Robert fox");
    timeAgo = timeAgo ?? Rx("2 days ago");
    letter = letter ?? Rx("A");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? username;

  Rx<String>? timeAgo;

  Rx<String>? letter;

  Rx<String>? id;
}
