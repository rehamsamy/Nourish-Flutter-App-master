import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/services/analytics_service.dart';

class OtpVerificationController extends GetxController {
  TextEditingController otp = TextEditingController();
  final Map args = Get.arguments ?? {};
  String? phone;

  late bool isLogin;
  RxBool isEmail = false.obs;

  @override
  void onInit() {
    super.onInit();
    AnalyticsService.instance.logEvent("Otp_Verification_View");
    isLogin = args["isLogin"] ?? true;
    isEmail.value = args["isEmail"] ?? false;
    phone = args['phone'];
  }
}
