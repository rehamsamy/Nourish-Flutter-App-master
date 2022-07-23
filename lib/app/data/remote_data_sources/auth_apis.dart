import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';
import 'package:nourish_sa/app/data/models/register_model.dart';
import 'package:nourish_sa/app/data/models/resend_otp_model.dart';
import 'package:nourish_sa/app/data/models/verify_email_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

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
    response.maybeWhen(
        ok: (data) {
          loginModel = data;
          return data;
        },
        noData: (info) {
          return null;
        },
        orElse: () {});
    return loginModel;
  }

  Future<VerifyEmailModel?> verifyOtpMobile(String mobile, String otp) async {
    VerifyEmailModel? verifyModel;
    Map<String, dynamic>? map = {'mobile': mobile, 'code': otp};
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'auth/verifyMobileOTP',
        data: NetworkRequestBody.json(map),
        headers: null);
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel
          .fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) async {
          VerifyEmailModel model = authResponse;
          //print("VerifyEmailModel model" + model.accessToken.toString());
          Get.find<SharedPrefService>().saveToken(model.accessToken ?? "");
          token = model.accessToken ?? "";
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
          Get.find<SharedPrefService>().saveToken(emailModel.accessToken ?? "");
          return emailModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return emailModel;
  }

  Future<LoginModel?> logoutUser() async {
    LoginModel? loginModel = LoginModel();
    const request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/logout',
      data: NetworkRequestBody.json(
        {},
      ),
    );
    NetworkResponse response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) async {
      print('vvv' + data.toString());
      loginModel = data as LoginModel;
      Get.find<SharedPrefService>().removeToken();
      return loginModel;
    }, orElse: () {
      //  print(response.toString());
      //  print("data");
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

  Future<String> refreshToken() async {
    VerifyEmailModel data = VerifyEmailModel();
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'auth/refresh',
        data: const NetworkRequestBody.json({}),
        headers: {"Authorization": "Bearer $token"});
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel
          .fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
      ok: (authResponse) async {
        data = authResponse as VerifyEmailModel;
        token = authResponse.accessToken;
        await Get.find<SharedPrefService>().saveToken(token ?? "");
        Get.forceAppUpdate();
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
