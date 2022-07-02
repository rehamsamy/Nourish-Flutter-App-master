import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class DaysTimeController extends GetxController {
  final TextEditingController startDayController = TextEditingController();

  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Days_Time_View");
    super.onInit();
  }
}
