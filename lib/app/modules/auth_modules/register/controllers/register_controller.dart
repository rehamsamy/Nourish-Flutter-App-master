import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';

class RegisterController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
RxBool isTermsAgreed = false.obs;


  Future<RegisterModel?> registerUser() async {
    Map<String, dynamic> ?map = {
      'first_name':firstName.text,
      'last_name':lastName.text,
      'mobile': phone.text,
      'email':email.text
    };
    Dio dio = Dio();
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
          AppConstants.kBaseUrl + "api/auth/register",
          data: map
      );
      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }


}
