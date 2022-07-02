import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/localization/local_keys.dart';
import 'package:nourish_sa/app/data/models/on_boarding_model.dart';

import '../../../../data/services/analytics_service.dart';

class OnBoardingController extends GetxController {
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("On_Boarding_View");
    super.onInit();
  }

  List<OnBoardingModel> data = [
    OnBoardingModel(
      title: LocalKeys.kOnboardin1Title.tr,
      subtitle: LocalKeys.kOnboardin1SubTitle.tr,
    ),
    OnBoardingModel(
      title: LocalKeys.kOnboardin2Title.tr,
      subtitle: LocalKeys.kOnboardin2SubTitle.tr,
    ),
    OnBoardingModel(
      title: LocalKeys.kOnboardin3Title.tr,
      subtitle: LocalKeys.kOnboardin3SubTitle.tr,
    ),
  ];
  RxInt currentPage = 0.obs;
  PageController pageController = PageController(initialPage: 0);
}
