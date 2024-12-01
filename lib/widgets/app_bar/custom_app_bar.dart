import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/app_export.dart';

enum Style { bgOutline }

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.text,
    this.onBackPress,
    // this.action,
    this.isAction = false,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;
  final void Function()? onBackPress;

  final Widget? title;
  final String? text;

  final bool? centerTitle;

  // final Widget? action;
  final bool? isAction;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      scrolledUnderElevation: 0,
      toolbarHeight: height ?? 79.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 100.v,
      );

  _getStyle() {
    switch (styleType) {
      case Style.bgOutline:
        return Padding(
          padding: EdgeInsets.only(top: 25.h, bottom: 21.h),
          child: Container(
            height: 100.v,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              border: Border(
                bottom: BorderSide(
                  color: appTheme.gray300,
                  width: 1.h,
                ),
              ),
            ),
            // child: Padding(
            //   padding: EdgeInsets.only(left: 16.h, right: 16.h),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     // mainAxisSize: MainAxisSize.max,
            //     children: [
            //       Expanded(
            //         child: Align(
            //           alignment: Alignment.centerLeft,
            //           child: leading ??
            //               GestureDetector(
            //                 onTap: () {
            //                   onBackPress!.call();
            //                 },
            //                 child: Container(
            //                   height: 40.h,
            //                   width: 40.h,
            //                   decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     color: appTheme.gray50,
            //                   ),
            //                   child: Center(
            //                     child: CustomImageView(
            //                       imagePath: ImageConstant.back,
            //                       height: 24.adaptSize,
            //                       width: 24.adaptSize,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Align(
            //           alignment: Alignment.center,
            //           child: title ??
            //               Text(
            //                 text ?? '',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 24.fSize,
            //                   fontFamily: 'SF Pro Display',
            //                   fontWeight: FontWeight.w700,
            //                 ),
            //               ),
            //         ),
            //       ),
            //       actions != null
            //           ? Expanded(
            //             child: Align(
            //               alignment: Alignment.centerRight,
            //               child: Row(
            //                   children: actions!,
            //                 ),
            //             ),
            //           )
            //           : Container(),
            //     ],
            //   ),
            // ),
          ),
        );
      default:
        return null;
    }
  }
}
