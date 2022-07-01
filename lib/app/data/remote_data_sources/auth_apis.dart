import 'dart:ffi';

import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';
import 'package:nourish_sa/app/data/models/resend_otp_model.dart';
import 'package:nourish_sa/app/data/models/user_model.dart';
import 'package:nourish_sa/app/data/models/verify_email_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/refreshTokenAndApp.dart';
import '../services/network_service.dart/dio_network_service.dart';

class AuthApis {
  Future<LoginModel?> loginUser(String mobile) async {
    LoginModel loginModel = LoginModel();
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
      print('vvv' + data.toString());
      loginModel = data;
      return data;
    }, noData: (info) {
      print('no data');
      return null;
    }, orElse: () {
      print(response);
      print("data");
    });
    return loginModel;
  }

  Future<VerifyEmailModel> verifyOtpMobile(String mobile, String otp) async {
    VerifyEmailModel verifyModel = VerifyEmailModel();
    Map<String, dynamic>? map = {'mobile': mobile, 'code': otp};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/verifyMobileOTP',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel
          .fromJson, // <- Function to convert API response to your model
    );

    response.maybeWhen(
        ok: (authResponse) async {
          verifyModel = authResponse as VerifyEmailModel;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Get.log('vvvvv   1'+prefs.getString('token').toString());
          prefs.setString('token', verifyModel.accessToken ?? '');
          Get.log('vvvvv   2'+prefs.getString('token').toString());
          SharedPrefService(prefs: prefs)
              .saveToken(verifyModel.accessToken ?? '');
          return verifyModel;
        },
        badRequest: (info) {},
        orElse: () {},
        invalidParameters: (x) => Get.log('error  + ' + x));
    return verifyModel;
  }

  Future<RegisterModel?> registerUser(
      String firstName, String lastName, String phone, String email) async {
    RegisterModel registerModel = RegisterModel();
    Map<String, dynamic>? map = {
      'first_name': firstName,
      'last_name': lastName,
      'mobile': phone,
      'email': email
    };
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/register',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      RegisterModel
          .fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          registerModel = response;
          return registerModel;
        },
        badRequest: (info) {},
        noData: (info) {
          print(info);
        },
        orElse: () {});

    return registerModel;
  }

  Future<VerifyEmailModel?> verifyEmail(String? code, String? email) async {
    VerifyEmailModel emailModel = VerifyEmailModel();
    Map<String, dynamic>? map = {'code': code, 'email': email};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/verifyEmailOTP',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel
          .fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) async {
          emailModel = authResponse;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', emailModel.accessToken ?? '');
          SharedPrefService(prefs: prefs)
              .saveToken(emailModel.accessToken ?? '');

          return emailModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return emailModel;
  }

  Future<LoginModel?> logoutUser() async {
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    LoginModel? loginModel = LoginModel();
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'auth/logout',
        data: NetworkRequestBody.json(
          {},
        ),
        headers: {
          'Authorization':
              'Bearer $token'
        });
    NetworkResponse response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) async{
      print('vvv' + data.toString());
      loginModel = data as LoginModel;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print('vvv1' +  prefs.getString('token').toString());
      prefs.getString('token');

      prefs.clear();
      Get.find<SharedPrefService>().removeToken();
      print('vvv1' +  prefs.getString('token').toString());
      return loginModel;
    }, orElse: () {
      print(response.toString());
      print("data");
    });
    return loginModel;
  }

  Future<ResendOtpModel> resendOtpMobile(String mobile) async {
    ResendOtpModel resendOtpModel = ResendOtpModel();
    Map<String, dynamic>? map = {'mobile': mobile};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/resendMobileOTP',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      ResendOtpModel
          .fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
      ok: (authResponse) async {
        resendOtpModel = authResponse as ResendOtpModel;
        return resendOtpModel;
      },
      badRequest: (info) {},
      orElse: () {},
    );
    return resendOtpModel;
  }

//TODO: Implement this method to get Refreshed Token
  Future<String> refreshToken() async {
    VerifyEmailModel verifyModel = VerifyEmailModel();
    String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/refresh',
      data: NetworkRequestBody.json({}),
      headers: {"Authorization": "Bearer $token"}
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
      ok: (authResponse) async {
        token = authResponse.accessToken;
        Get.find<SharedPrefService>().saveToken(token ?? "");
      },
      badRequest: (info) {},
      noAuth: (data) {
       // refreshAppWithNewToken();
      },
      orElse: () {},
    );
    return token ?? "";
  }
}
