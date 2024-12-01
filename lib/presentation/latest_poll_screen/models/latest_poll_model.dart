import '../../../core/app_export.dart';
import 'listicheart_one1_item_model.dart';
import 'stack_item_model.dart';

/// This class defines the variables used in the [latest_poll_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class LatestPollModel {
  Rx<List<ListicheartOne1ItemModel>> listicheartOne1ItemList = Rx([
    ListicheartOne1ItemModel(
        image: ImageConstant.imgRectangle3841.obs,
        icheartone: ImageConstant.imgIcHeart.obs),
    ListicheartOne1ItemModel(
        image: ImageConstant.imgRectangle3842.obs,
        icheartone: ImageConstant.imgIcHeartBlack900.obs)
  ]);

  Rx<List<StackItemModel>> stackItemList = Rx([
    StackItemModel(image: ImageConstant.imgRectangle3843.obs, text: "70%".obs),
    StackItemModel(image: ImageConstant.imgRectangle3844.obs, text: "30%".obs)
  ]);
}
