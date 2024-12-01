import '../../../core/app_export.dart';

/// This class is used in the [listicheart_one1_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class ListicheartOne1ItemModel {
  ListicheartOne1ItemModel({this.image, this.icheartone, this.id}) {
    image = image ?? Rx(ImageConstant.imgRectangle3841);
    icheartone = icheartone ?? Rx(ImageConstant.imgIcHeart);
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? icheartone;

  Rx<String>? id;
}
