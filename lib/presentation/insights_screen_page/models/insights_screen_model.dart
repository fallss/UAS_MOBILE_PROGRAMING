import '../../../core/app_export.dart';
import 'listicheart_one_item_model.dart';
import 'stack_item_model.dart';

/// This class defines the variables used in the [insights_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

class InsightsScreenModel {
  Rx<List<ListicheartOneItemModel>> listicheartOneItemList = Rx([
    ListicheartOneItemModel(
        image: ImageConstant.imgRectangle3841.obs,
        icheartone: ImageConstant.imgIcHeart.obs),
    ListicheartOneItemModel(
        image: ImageConstant.imgRectangle3842.obs,
        icheartone: ImageConstant.imgIcHeartBlack900.obs)
  ]);

  Rx<List<StackItemModel>> stackItemList = Rx([
    StackItemModel(image: ImageConstant.imgRectangle3843.obs, text: "60%".obs),
    StackItemModel(image: ImageConstant.imgRectangle3844.obs, text: "40%".obs)
  ]);
}
