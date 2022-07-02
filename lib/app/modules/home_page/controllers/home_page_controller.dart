import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/remote_data_sources/auth_apis.dart';

import '../../../data/services/analytics_service.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Home_Page");

    AuthApis().refreshToken();
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
