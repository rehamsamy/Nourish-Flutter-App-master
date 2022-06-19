<<<<<<< Updated upstream
=======
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
>>>>>>> Stashed changes
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';
import 'package:nourish_sa/app/data/models/verify_email_model.dart';

import '../services/network_service.dart/dio_network_service.dart';

class AuthApis {
  Future<LoginModel?> loginUser(String mobile) async {
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/login',
      data: NetworkRequestBody.json(
        {"mobile": mobile},
      ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      print(data.data.msg);
      return data;
    }, orElse: () {
      print(response.toString());
      print("data");
    });
  }

  Future<VerifyEmailModel?> verifyOtpMobile(String mobile, otp) async {
    VerifyEmailModel? emailModel;
    Map<String, dynamic>? map = {'mobile': mobile, 'code': otp};
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'auth/login',
      data: NetworkRequestBody.json(
        {"mobile": "$mobile"},
      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) {
          return authResponse.data.weekly;
        },
        badRequest: (info) {},
        orElse: () {});
  }

  Future<RegisterModel?> registerUser(
      String firstName, String lastName, String phone, String email) async {
    Map<String, dynamic>? map = {
      'first_name': firstName,
      'last_name': lastName,
      'mobile': phone,
      'email': email
    };
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'auth/login',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) {
          return authResponse.data.weekly;
        },
        badRequest: (info) {},
        orElse: () {});
  }

  Future<RegisterModel?> verifyMobile(String code, String mobile) async {
    Map<String, dynamic>? map = {'code': code, 'email': mobile};
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'auth/login',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) {
          return authResponse.data.weekly;
        },
        badRequest: (info) {},
        orElse: () {});
  }

  Future<RegisterModel?> verifyEmail(String code, String email) async {
    Map<String, dynamic>? map = {'code': code, 'email': email};
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'auth/login',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) {
          return authResponse.data.weekly;
        },
        badRequest: (info) {},
        orElse: () {});
  }
}
