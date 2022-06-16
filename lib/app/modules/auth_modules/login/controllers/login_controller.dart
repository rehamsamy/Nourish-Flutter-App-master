import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  RxBool isLoginedBefore = false.obs;
  String? image;  String? name;


@override
  void onInit() {
    //  isLoginedBefore = check if have shared prefersence value.
    // if true get image file from shared preferance.
    super.onInit();
  }



}
