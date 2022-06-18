import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';
import 'package:nourish_sa/app/data/models/verify_email_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApis {
  Future<LoginModel?> loginUser(String mobile) async {
    LoginModel? loginModel;
    Map<String, dynamic>? map = {
      'mobile': mobile,
    };
    Dio dio = Dio();
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response =
          await dio.post(AppConstants.kBaseUrl + "api/auth/login", data: map);
      loginModel = LoginModel.fromJson(response.data) as LoginModel;
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        Get.snackbar("Unknown Network error", e.message);
      } else if (e.response?.statusCode == 200) {
        Get.snackbar("Success", e.message.toString());
        // return null;
      }
    }
  }

  Future<VerifyEmailModel?> verifyOtpMobile( String mobile,otp) async {
    VerifyEmailModel? emailModel;
    Map<String, dynamic>? map = {
      'mobile': mobile,
      'code':otp
    };
    Dio dio = Dio();
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);
      final response =
      await dio.post(AppConstants.kBaseUrl + "api/auth/verifyMobileOTP", data: map);
      emailModel = VerifyEmailModel.fromJson(response.data);
      return VerifyEmailModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        Get.snackbar("Unknown Network error", e.message);
      } else if (e.response?.statusCode == 200) {
        SharedPreferences prefs=await SharedPreferences.getInstance();
        Get.snackbar("Success", e.message.toString());
        String userMod = json.encode(emailModel?.user);
        String userToken = json.encode(emailModel?.accessToken);
        SharedPrefService(prefs: prefs).saveToken(userToken);
        prefs.setString("userModel",userMod);
        prefs.setString("tokenAccess", userToken);
      }
    }
  }


  Future<RegisterModel?> registerUser(
      String firstName, String lastName, String phone, String email) async {
    Map<String, dynamic>? map = {
      'first_name': firstName,
      'last_name': lastName,
      'mobile': phone,
      'email': email
    };
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio
          .post(AppConstants.kBaseUrl + "api/auth/register", data: map);
      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
