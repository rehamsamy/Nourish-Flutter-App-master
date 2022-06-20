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
 const   String token1='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTU3MzcxMjksImV4cCI6MTY1NTc0MDcyOSwibmJmIjoxNjU1NzM3MTI5LCJqdGkiOiI1UEhYMmw2NDU0ZWV5Z2lCIiwic3ViIjoxNywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.iU870BiHBk-yUyBGqJSaEXGpPVHA0naKOsGvutfIs5Y';
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    const request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'me',
        data: NetworkRequestBody.json(
          {},
        ),

        headers: {
          'Authorization':'Bearer $token1',
        });
    final response = await networkService.execute(
      request,
      UserModel.fromJson, // <- Function to convert API response to your model
    );
    Get.log('ggggg 1 ' + response.toString());
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
    const   String token1='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTU3MzcxMjksImV4cCI6MTY1NTc0MDcyOSwibmJmIjoxNjU1NzM3MTI5LCJqdGkiOiI1UEhYMmw2NDU0ZWV5Z2lCIiwic3ViIjoxNywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.iU870BiHBk-yUyBGqJSaEXGpPVHA0naKOsGvutfIs5Y';
    UpdateProfileModel? updateProfileModel = UpdateProfileModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    final request = const NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'updateProfile',
      data: NetworkRequestBody.json(
        {},
      ),
       headers: {'Authorization':'Bearer $token1'}
    );
    final response = await networkService.execute(
      request,
      UserModel.fromJson, // <- Function to convert API response to your model
    );
    Get.log('ggggg ' + first_name+last_name+email+mobile);
    response.maybeWhen(
        ok: (response) {
          Get.log('ggggg ' + response.toString());
          updateProfileModel = response;
        },
        orElse: () {});
    return updateProfileModel;
  }
}
