import '../../../core/app_export.dart';
import 'listicheart_one2_item_model.dart';
import 'stack1_item_model.dart';

/// This class defines the variables used in the [polls_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class PollsScreenModel {
  Rx<List<ListicheartOne2ItemModel>> listicheartOne2ItemList = Rx([
    ListicheartOne2ItemModel(
        image: ImageConstant.imgRectangle3841.obs,
        icheartone: ImageConstant.imgIcHeart.obs),
    ListicheartOne2ItemModel(
        image: ImageConstant.imgRectangle3842.obs,
        icheartone: ImageConstant.imgIcHeartBlack900.obs)
  ]);

  Rx<List<Stack1ItemModel>> stack1ItemList = Rx([
    Stack1ItemModel(image: ImageConstant.imgRectangle3843.obs, text: "60%".obs),
    Stack1ItemModel(image: ImageConstant.imgRectangle3844.obs, text: "40%".obs)
  ]);
}
