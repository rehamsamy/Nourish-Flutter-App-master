import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/services/analytics_service.dart';

class RegisterController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  RxBool isTermsAgreed = false.obs;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Register_View");
    super.onInit();
  }
}
