import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/update_profile_model.dart';
import 'package:nourish_sa/app/data/models/user_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class ProfileApis {
  Future<UserModel?> getProfileInfo() async {
    UserModel? userModel = UserModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    const request = NetworkRequest(
        type: NetworkRequestType.GET,
        path: 'me',
        data: NetworkRequestBody.json(
          {},
        ),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZWF0LW5vdXJpc2guY29tXC9hcGlcL2F1dGhcL3ZlcmlmeU1vYmlsZU9UUCIsImlhdCI6MTY1NTcyNDY4OCwiZXhwIjoxNjU1NzI4Mjg4LCJuYmYiOjE2NTU3MjQ2ODgsImp0aSI6ImM4NnowWHhGT1VJMUxrVWsiLCJzdWIiOjE2LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.zw1FPcegZQw8Tp1ecU21IWZAt-tb0-N5HAvLe3yAFlY}'
        });
    final response = await networkService.execute(
      request,
      UserModel.fromJson, // <- Function to convert API response to your model
    );
    Get.log('ggggg ' + response.toString());
    response.maybeWhen(
        ok: (response) {
          Get.log('ggggg ' + response.toString());
          userModel = response;
        },
        orElse: () {});
    return userModel;
  }

  Future<UpdateProfileModel?> updateProfileInfo(
      {required String first_name,
      required String last_name,
      required String mobile,
      required String email}) async {
    UpdateProfileModel? updateProfileModel = UpdateProfileModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = const NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'updateProfile',
      data: NetworkRequestBody.json(
        {},
      ),
      // headers: {'Authorization':'Bearer ${token.toString()}'}
    );
    final response = await networkService.execute(
      request,
      UserModel.fromJson, // <- Function to convert API response to your model
    );
    Get.log('ggggg ' + response.toString());
    response.maybeWhen(
        ok: (response) {
          Get.log('ggggg ' + response.toString());
          updateProfileModel = response;
        },
        orElse: () {});
    return updateProfileModel;
  }
}
