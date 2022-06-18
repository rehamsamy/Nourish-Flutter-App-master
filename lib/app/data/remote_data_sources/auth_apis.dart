import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';

class AuthApis {
  Future<LoginModel?> loginUser(String mobile) async {
    Map<String, dynamic>? map = {
      'mobile': mobile,
    };
  }


  // Future<LoginModel?> loginUser(String mobile) async {
  //   Map<String, dynamic>? map = {
  //     'mobile': mobile,
  //   };
  // }


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
      dio.interceptors.add(dioLoggerInterceptor);

      final response = await dio
          .post(AppConstants.kBaseUrl + "api/auth/register", data: map);
      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
