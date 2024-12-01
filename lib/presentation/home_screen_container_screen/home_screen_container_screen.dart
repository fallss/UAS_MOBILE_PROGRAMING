// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:status/presentation/polls_screen_page/polls_screen_page.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../add_new_poll_answer_screen_page/add_new_poll_answer_screen_page.dart';
import '../home_screen_page/home_screen_page.dart';
import '../insights_screen_page/insights_screen_page.dart';
import '../profile_screen_page/profile_screen_page.dart';
import 'controller/home_screen_container_controller.dart'; // ignore_for_file: must_be_immutable

class HomeScreenContainerScreen
    extends GetWidget<HomeScreenContainerController> {
  HomeScreenContainerScreen({Key? key})
      : super(
          key: key,
        );
  List<Widget> screen = [
    HomeScreenPage(),
    PollsScreenPage(),
    AddNewPollAnswerScreenPage(),
    InsightsScreenPage(),
    ProfileScreenPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder: (controller) {
        return WillPopScope(
            onWillPop: () {
              return controller.onExit(context);
            },
            child: Scaffold(
              //     appBar: getInVisibleAppBar(
              //   statusBarIconBrightness: Brightness.dark,
              //   statusBarBrightness: Brightness.dark,
              // ),
              body: SafeArea(child: screen[controller.selectedIndex.value]),

              bottomNavigationBar: CustomBottomBar(
                onChanged: (BottomBarEnum type) {
                  Get.toNamed(getCurrentRoute(type), id: 1);
                },
              ),
              // floatingActionButton: Padding(
              //   padding: EdgeInsets.only(top: 60.h, left: 16.h, right: 16.h),
              //   child: Container(
              //     height: 60.h,
              //     width: 60.h,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: theme.colorScheme.primary,
              //     ),
              //   ),
              // ),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.centerDocked,
            ));
      },
    );
    // return  Scaffold(
    //   body: SafeArea(
    //     child: Navigator(
    //       key: Get.nestedKey(1),
    //       initialRoute: AppRoutes.homeScreenPage,
    //       onGenerateRoute: (routeSetting) => GetPageRoute(
    //         page: () => getCurrentPage(routeSetting.name!),
    //         transition: Transition.noTransition,
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBar: _buildBottombar(),
    // );
  }

  // /// Section Widget
  // Widget _buildBottombar() {
  //   return CustomBottomBar(
  //     onChanged: (BottomBarEnum type) {
  //       Get.toNamed(getCurrentRoute(type), id: 1);
  //     },
  //   );
  // }

  ///Handling route based on bottom click actions`
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.homeScreenPage:
  //       return HomeScreenPage();
  //     case AppRoutes.pollsScreenPage:
  //       return PollsScreenPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }

  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.latestPollScreen,
      );
    });
  }
}
