import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
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
