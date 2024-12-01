import 'dart:async';

import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(
      reverse: false, min: 0.5, max: 1.0, period: const Duration(seconds: 5));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    getIntro();
  }

  getIntro() async {
    bool isIntro = await PrefUtils.getIntro();
    bool isLogin = await PrefUtils.getLogin();
    Timer(
      const Duration(seconds: 3),
      () {
        if (isIntro) {
          Get.toNamed(
            AppRoutes.onBoardingPage,
          );

          // Constant.sendToNext(context, Routes.introRoute);
        } else {
          print("login===${isLogin}");
          if (isLogin) {
            Get.toNamed(
              AppRoutes.loginPage,
            );
          } else {
            Get.toNamed(
              AppRoutes.homeScreenContainerScreen,
            );

            // Constant.sendToNext(context, Routes.loginRoute);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // double _h = MediaQuery.of(context).size.height;
    // double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: ScaleTransition(
            scale: _animation,
            child: CustomImageView(
              imagePath: ImageConstant.app_Logo,
              width: 326.h,
              height: 154.h,
              fit: BoxFit.contain,
            )),
      ),
    ));
  }
}
