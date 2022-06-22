
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

  Future<VerifyEmailModel> verifyOtpMobile(String mobile, String otp) async {
    VerifyEmailModel verifyModel=VerifyEmailModel();
    Get.log('otp   =>'+mobile+otp);
    Map<String, dynamic>? map = {'mobile': mobile, 'code': otp};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/verifyMobileOTP',
      data: NetworkRequestBody.json(
          map

      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel.fromJson, // <- Function to convert API response to your model
    );
    Get.log('ttttt1'+response.toString());
    response.maybeWhen(
        ok: (authResponse) {
          Get.log('ttttt1'+authResponse.toString());
          verifyModel=authResponse as VerifyEmailModel;
         // SharedPreferences prefs= await SharedPreferences.getInstance();
        //  prefs.setString('token', verifyModel.accessToken??'');
          Get.log('token  saved  =>');
        //  SharedPrefService(prefs: prefs).saveToken(verifyModel.accessToken??'');
          Get.log('token  saved  =>'+Get.find<SharedPrefService>().getToken().toString());
          return verifyModel;
        },
        badRequest: (info) {},
        orElse: () {
          Get.log('error  + ');
        },
   );
    return verifyModel;
  }

  Future<RegisterModel?> registerUser(
      String firstName, String lastName, String phone, String email) async {
    RegisterModel registerModel=RegisterModel();
    Get.log('register data  =>  '+firstName+lastName+email+phone);
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
      RegisterModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (response) {
          registerModel=response;
          return registerModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return registerModel;
  }

  Future<VerifyEmailModel?> verifyEmail(String ? code, String ? email) async {
    Get.log('email   reg '+code.toString()+email.toString());
    VerifyEmailModel emailModel=VerifyEmailModel();
    Map<String, dynamic>? map = {'code': code, 'email': email};
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/verifyEmailOTP',
      data: NetworkRequestBody.json(map),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      VerifyEmailModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (authResponse) async{
          emailModel=authResponse;
          SharedPreferences prefs= await SharedPreferences.getInstance();
          prefs.setString('token', emailModel.accessToken??'');
          SharedPrefService(prefs: prefs).saveToken(emailModel.accessToken??'');

          return emailModel;
        },
        badRequest: (info) {},
        orElse: () {});

    return emailModel;
  }

  Future<LoginModel?> logoutUser() async {
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    LoginModel? loginModel=LoginModel();
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'auth/logout',
      data: NetworkRequestBody.json(
        {},
      ),
      headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTU4OTM2NzksImV4cCI6MTY1NTg5NzI3OSwibmJmIjoxNjU1ODkzNjc5LCJqdGkiOiJXWmVhTDRmSlN2OUg1WFAyIiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.7mvWFNdOj7AF4iqp7ENLjW5gs4ux0EjIdHsprPMnPr4'}
    );
    NetworkResponse response = await networkService.execute(
      request,
      LoginModel.fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(ok: (data) {
      print('vvv'+
          data.toString());
      loginModel=data as LoginModel;
      return loginModel;
    }, orElse: () {
      print(response.toString());
      print("data");
    });
    return loginModel;
  }
}
