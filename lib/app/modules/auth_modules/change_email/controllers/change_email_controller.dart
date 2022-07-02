import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/services/analytics_service.dart';

class ChangeEmailController extends GetxController {
  TextEditingController email = TextEditingController();
  final Map args = Get.arguments ?? {};
  String? otp;
  @override
  void onInit() {
    AnalyticsService.instance.logEvent("Change_Email_View");
    otp = args['otp'];
    super.onInit();
  }
}
