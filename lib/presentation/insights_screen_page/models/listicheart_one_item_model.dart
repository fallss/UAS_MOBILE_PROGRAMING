import '../../../core/app_export.dart';

/// This class is used in the [listicheart_one_item_widget] screen.
// ignore_for_file: must_be_immutable

class ListicheartOneItemModel {
  ListicheartOneItemModel({this.image, this.icheartone, this.id}) {
    image = image ?? Rx(ImageConstant.imgRectangle384);
    icheartone = icheartone ?? Rx(ImageConstant.imgIcHeart);
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? icheartone;

  Rx<String>? id;
}
