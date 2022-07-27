import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class HomeScreenController extends GetxController {
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
    AnalyticsService.instance.logEvent("Home_View");

    handleIsLoading(true);
  }

  handleIsLoading(bool val) {
    isLoading = val;
    update();
  }
}
