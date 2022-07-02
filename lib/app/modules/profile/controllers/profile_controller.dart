import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/analytics_service.dart';

class ProfileController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController otp = TextEditingController();
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Profile_View");
    super.onInit();
  }
}
