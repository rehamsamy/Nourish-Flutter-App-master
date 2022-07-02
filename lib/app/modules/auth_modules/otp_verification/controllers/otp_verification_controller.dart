import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/otp_mobile_verify_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    isLogin = args["isLogin"] ?? false;
    isEmail.value = args["isEmail"] ?? false;
    phone = args['phone'];
  }
}
