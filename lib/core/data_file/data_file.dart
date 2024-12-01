import 'package:flutter/material.dart';
import 'package:status/core/app_export.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../presentation/home_screen_page/models/next_trip_model.dart';
import '../../presentation/home_screen_page/models/tips_model.dart';
import '../../presentation/onbording_screen/model/onboarding_model.dart';
import '../../presentation/popular_creators_screen/models/popular_creators_model.dart';

class DataFile {
  static List<OnBoardingModel> onBordData = [
    OnBoardingModel(
        title: "Make your voice count with instant polls",
        image: ImageConstant.intro1,
        description:
            "Unleash the power of opinion real-time insights with every poll"),
    OnBoardingModel(
        title: "Unleash the power of opinion get answers with fun polls",
        image: ImageConstant.intro2,
        description:
            'Unleash the power of opinion get answers with fun, easy-to-create polls. make your voice heard'),
    OnBoardingModel(
        title: "Settle the debate polling made simple, results in seconds. ",
        image: ImageConstant.intro3,
        description:
            'Settle the debate once and for all polling made simple, results delivered in seconds.'),
  ];
  static List<NextTripModel> nextTripList = [
    NextTripModel(option: "A", title: "Paris", vote: "09%", width: 92.h),
    NextTripModel(option: "B", title: "Paris", vote: "28%", width: 123.h),
    NextTripModel(option: "C", title: "Paris", vote: "33%", width: 185.h),
    NextTripModel(option: "D", title: "Paris", vote: "32%", width: 166.h),
  ];

  static List<NextTripModel> latestPoll = [
    NextTripModel(option: "A", title: "Paris", vote: "09%", width: 92.h),
    NextTripModel(option: "B", title: "Paris", vote: "29%", width: 123.h),
    NextTripModel(option: "C", title: "Paris", vote: "33%", width: 185.h),
    NextTripModel(option: "D", title: "Paris", vote: "32%", width: 166.h),
  ];
  static List<TipsList> tipsList = [
    TipsList(option: "A", title: "Australia"),
    TipsList(option: "B", title: "Bangkok"),
    TipsList(option: "C", title: "South korea"),
    TipsList(option: "D", title: "Hong kong"),
  ];

  static List<TipsList> carBrand = [
    TipsList(option: "A", title: "Lamborghini"),
    TipsList(option: "B", title: "Toyota"),
    TipsList(option: "C", title: "Range rover"),
    TipsList(option: "D", title: "BMW"),
  ];
  static List<PopularCreatorsModel> popularModel = [
    PopularCreatorsModel(name: "Robert fox", image: ImageConstant.popular1),
    PopularCreatorsModel(name: "Jenny wilson", image: ImageConstant.popular2),
    PopularCreatorsModel(
        name: "Ronald richards", image: ImageConstant.popular3),
    PopularCreatorsModel(name: "Ralph edwards", image: ImageConstant.popular4),
    PopularCreatorsModel(name: "John smith", image: ImageConstant.popular5),
    PopularCreatorsModel(name: "Kristin watson", image: ImageConstant.popular6),
    PopularCreatorsModel(name: "Esther howards", image: ImageConstant.popular3),
    PopularCreatorsModel(name: "Cody fisher", image: ImageConstant.popular7),
    PopularCreatorsModel(name: "Kristin watson", image: ImageConstant.popular8),
    PopularCreatorsModel(name: "Oliver green", image: ImageConstant.popular9),
    PopularCreatorsModel(name: "John smith", image: ImageConstant.popular4),
    PopularCreatorsModel(name: "Albert flores", image: ImageConstant.popular10),
  ];
  static List<TipsList> trendingPoll = [
    TipsList(option: "A", title: "Australia"),
    TipsList(option: "B", title: "Bangkok"),
    TipsList(option: "C", title: "South korea"),
    TipsList(option: "D", title: "Hong kong"),
  ];

  static List<TipsList> profileTrips = [
    TipsList(option: "A", title: "Australia"),
    TipsList(option: "B", title: "Bangkok"),
    TipsList(option: "C", title: "South korea"),
    TipsList(option: "D", title: "Hong kong"),
  ];

  static List<NextTripModel> pollList = [
    NextTripModel(option: "A", title: "Paris", vote: "09%", width: 92.h),
    NextTripModel(option: "B", title: "Paris", vote: "29%", width: 123.h),
    NextTripModel(option: "C", title: "Paris", vote: "33%", width: 185.h),
    NextTripModel(option: "D", title: "Paris", vote: "32%", width: 166.h),
  ];

  static List<TipsList> brandList = [
    TipsList(option: "A", title: "Lamborghini"),
    TipsList(option: "B", title: "Toyota"),
    TipsList(option: "C", title: "Range rover"),
    TipsList(option: "D", title: "BMW"),
  ];
}

Widget animationFunction(
  index,
  child, {
  Duration? listAnimation,
  Duration? slideDuration,
  Duration? slideDelay,
}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: listAnimation ?? const Duration(milliseconds: 800),
    child: SlideAnimation(
      duration: slideDuration ?? const Duration(milliseconds: 500),
      delay: slideDelay ?? const Duration(milliseconds: 50),
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
  //animationFunction(index, ExamsItemWidget(model));
}
