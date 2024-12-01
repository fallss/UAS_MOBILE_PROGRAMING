// ignore_for_file: duplicate_ignore

import '../../../core/app_export.dart';

/// This class is used in the [stack_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class StackItemModel {
  StackItemModel({this.image, this.text, this.id}) {
    image = image ?? Rx(ImageConstant.imgRectangle3843);
    text = text ?? Rx("70%");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? text;

  Rx<String>? id;
}
