import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/otp_mobile_verify_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';

class OtpVerificationController extends GetxController {
  TextEditingController otp = TextEditingController();
  final Map args = Get.arguments ?? {};

  late bool isLogin;
  RxBool isEmail = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLogin = args["isLogin"] ?? false;
    isEmail.value = args["isEmail"] ?? false;
  }

  Future<OtpMobileVerifyModel?> verifyMobileOtp(String mobile) async {
    Map<String, dynamic> ?map = {
      'code':otp.text,
      'mobile': CupertinoIcons.money_dollar,
    };
    Dio dio = Dio();
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
          AppConstants.kBaseUrl + "api/auth/verifyMobileOTP",
          data: map
      );
      return OtpMobileVerifyModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }


}
