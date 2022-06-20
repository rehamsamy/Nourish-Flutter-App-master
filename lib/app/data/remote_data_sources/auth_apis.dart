
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';
import 'package:nourish_sa/app/data/models/verify_email_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/network_service.dart/dio_network_service.dart';

class AuthApis {
  Future<LoginModel?> loginUser(String mobile) async {
    LoginModel loginModel=LoginModel();
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
      print('vvv'+
          data.toString());
      loginModel=data;
      return data;
    }, orElse: () {
      print(response.toString());
      print("data");
    });
    return loginModel;
  }

  Future<VerifyEmailModel?> verifyOtpMobile(String mobile, otp) async {
    VerifyEmailModel emailModel=VerifyEmailModel();
    Map<String, dynamic>? map = {'mobile': '1143551071', 'code': otp};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/verifyMobileOTP',
      data: NetworkRequestBody.json(
          {'mobile': '1143551071', 'code': otp}

      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) async{
          Get.log('ttttt1'+authResponse.toString());
          emailModel=authResponse;
          SharedPreferences prefs= await SharedPreferences.getInstance();
          prefs.setString('token', emailModel.accessToken??'');
          SharedPrefService(prefs: prefs).saveToken(emailModel.accessToken??'');
         // return authResponse;
        },
        badRequest: (info) {},
        orElse: () {});
    return emailModel;
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
