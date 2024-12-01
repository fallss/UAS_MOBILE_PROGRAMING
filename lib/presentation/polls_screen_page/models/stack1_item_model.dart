import '../../../core/app_export.dart';

/// This class is used in the [stack1_item_widget] screen.
// ignore_for_file: must_be_immutable

// ignore: duplicate_ignore
// ignore_for_file: must_be_immutable
class Stack1ItemModel {
  Stack1ItemModel({this.image, this.text, this.id}) {
    image = image ?? Rx(ImageConstant.imgRectangle3843);
    text = text ?? Rx("60%");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? text;

  Rx<String>? id;
}
