import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/services/analytics_service.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  RxBool isLoginedBefore = false.obs;
  String? image;
  String? name;

  @override
  void onInit() {
    //  isLoginedBefore = check if have shared prefersence value.
    // if true get image file from shared preferance.
    AnalyticsService.instance.logEvent("Login_View");
    //  isLoginBefore = check if have shared preference value.
    // if true get image file from shared prefeance.
    super.onInit();
  }
}
