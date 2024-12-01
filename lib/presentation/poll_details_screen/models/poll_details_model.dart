import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [insights_result_image_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

class PollDetailsModel {
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        userImage: ImageConstant.popular3.obs,
        username: "Robert fox".obs,
        timeAgo: "2 days ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular2.obs,
        username: "Jenny wilson".obs,
        timeAgo: "18 hours ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular1.obs,
        username: "Alexander johnson".obs,
        timeAgo: "2 days ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular11.obs,
        username: "Ronald richards".obs,
        timeAgo: "1 days ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular12.obs,
        username: "Esther richards".obs,
        timeAgo: "23 hours ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular13.obs,
        username: "Ronald fox".obs,
        timeAgo: "18 hours ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular14.obs,
        username: "John richards".obs,
        timeAgo: "1 hour ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular15  .obs,
        username: "Esther cooper".obs,
        timeAgo: "30 mins ago".obs,
        letter: "A".obs),
    UserprofileItemModel(
        userImage: ImageConstant.popular4.obs,
        username: "Ronald richards".obs,
        timeAgo: "1 mins ago".obs,
        letter: "A".obs)
  ]);
}
