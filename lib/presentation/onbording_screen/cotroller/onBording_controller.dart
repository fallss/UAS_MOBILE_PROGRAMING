import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  // Rx<OnBoardingModel> onboardingOneModelObj = OnBoardingModel().obs;
  onChange(value){
    sliderIndex=value;
    update();
  }
  PageController pageController=PageController();
  int sliderIndex = 0;
}

