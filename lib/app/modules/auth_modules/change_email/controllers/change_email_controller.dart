import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeEmailController extends GetxController {
  TextEditingController email = TextEditingController();
  final Map args = Get.arguments ?? {};
  String? otp;
  @override
  void onInit() {
    otp = args['otp'];
    super.onInit();
  }

}
