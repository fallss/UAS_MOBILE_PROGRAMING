import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.label,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;
  final String?label;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: textFormFieldWidget,
    )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
    width: width ?? double.maxFinite,
    child: TextFormField(onChanged: (value) {
      print(value);
      controller!.text = value;
    },
      cursorErrorColor: appTheme.errorColor,

      // obscuringCharacter: '*',
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },

      autofocus: autofocus!,
      style: textStyle ?? TextStyle(
        color: Colors.black,
        fontSize: 17.fSize,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
      ),
      obscureText: obscureText!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
    ),
  );
  InputDecoration get decoration => InputDecoration(

    hintText: hintText ?? "",labelText: label??'',
    hintStyle: hintStyle ?? TextStyle(
      color: appTheme.gray700,
      fontSize: 17.fSize,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
    ),
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(14.h),
    fillColor: fillColor ?? Colors.transparent,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.borderColor,
            width: 1,
          ),
        ),
    errorBorder:
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.h),
      borderSide: BorderSide(
        color: appTheme.errorColor,
        width: 1,
      ),
    ),
    labelStyle: TextStyle(
      // color: controller!.text.isEmpty?appTheme.gray600:Colors.black,
      fontSize: 16.fSize,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
    ),
    errorStyle: TextStyle(
      color: appTheme.errorColor,
      fontSize: 15.fSize,
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
    ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.borderColor,
            width: 1,
          ),
        ),focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.h),
    borderSide: BorderSide(
      color: appTheme.errorColor,
      width: 1,
    ),

  ),

    focusedBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
  );
}
