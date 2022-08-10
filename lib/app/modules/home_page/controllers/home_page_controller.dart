import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Home_Page");


    //AuthApis().refreshToken();

    Get.log('vvvvvvv  1');
    //AuthApis().refreshToken().then((value) => Get.log('vvvvvvv  '+value));
    super.onInit();
  }

  RxInt currentIndex = 0.obs;

  changeIndex(value) {
    currentIndex.value = value;
  }

  double getIndicatorPosition(int index) {
    var isLtr = Directionality.of(Get.context!) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (3))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (3))!;
    }
  }
}
