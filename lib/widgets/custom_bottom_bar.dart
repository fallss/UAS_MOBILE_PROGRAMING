import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status/core/app_export.dart';

//ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  // RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.home_unselect,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.unselect_polls,
      activeIcon: ImageConstant.polls_select,
      title: "Polls".tr,
      type: BottomBarEnum.Favorite,
    ),
    BottomMenuModel(
      icon: ImageConstant.add_poll,
      activeIcon: ImageConstant.add_poll,
      title: "",
      type: BottomBarEnum.Home,
      isCircle: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.unselect_insights,
      activeIcon: ImageConstant.insights_select,
      title: "Insights".tr,
      type: BottomBarEnum.History,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.profile_select,
      title: "Profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 130.v : 95.v,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(
              0,
              -6,
            ),
          ),
        ],
      ),
      child: GetBuilder<CustomBottomBarController>(
          init: CustomBottomBarController(),
          builder: (controller) {
            return BottomNavigationBar(
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              elevation: 0,
              currentIndex: controller.selectedIndex.value,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomMenuList.length, (index) {
                if (bottomMenuList[index].isCircle) {
                  return BottomNavigationBarItem(
                    icon: CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 56.adaptSize,
                      width: 56.adaptSize,
                      // color: appTheme.whiteA700,
                      margin: EdgeInsets.all(12.h),
                    ),
                    label: '',
                  );
                }
                return BottomNavigationBarItem(
                  icon: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: bottomMenuList[index].icon,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          color: appTheme.gray700,
                          margin: EdgeInsets.only(top: 20.v),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            bottom: 10.v,
                          ),
                          child: Text(
                            bottomMenuList[index].title ?? "",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: appTheme.gray700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        height: 32.h,
                        width: 59.h,
                        margin: EdgeInsets.only(top: 20.v),
                        decoration: BoxDecoration(
                            color: Color(0xFFEFEFFB),
                            borderRadius: BorderRadius.circular(170.h)),
                        child: Center(
                          child: CustomImageView(
                            imagePath: bottomMenuList[index].activeIcon,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            // color: theme.colorScheme.primary,
                            // margin: EdgeInsets.only(top: 20.v),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.v,
                          bottom: 10.v,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.bodyMediumPrimary.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                );
              }),
              onTap: (index) {
                // selectedIndex.value = index;
                // onChanged?.call(bottomMenuList[index].type);
                controller.getIndex(index);
              },
            );
          }),
    );
  }
}

enum BottomBarEnum {
  Home,
  Favorite,
  History,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isCircle = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isCircle;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  getIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  onExit(BuildContext context) {
    print("index===$selectedIndex");
    if (selectedIndex.value != 0) {
      selectedIndex.value = 0;
      getIndex(0);
      update();
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
          insetPadding: EdgeInsets.only(left: 16.h, right: 16.h),
          title: Padding(
            padding: EdgeInsets.only(left: 15.h, right: 15.h),
            child: Text('Are you sure you want to Exit ?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.fSize,
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.h),
                              border: Border.all(
                                color: theme.colorScheme.primary,
                                width: 1.5.h,
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                            child: Center(
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontSize: 18.h.fSize,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        if (Platform.isIOS) {
                          exit(0);
                        } else {
                          SystemNavigator.pop();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.h),
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            color: theme.colorScheme.primary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 14.v, bottom: 14.h),
                            child: Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.fSize,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
