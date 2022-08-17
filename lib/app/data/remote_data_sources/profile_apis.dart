import 'package:get/get_core/src/get_main.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/profile_model.dart';
import 'package:nourish_sa/app/data/models/update_profile_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class ProfileApis {
  Future<ProfileModel?> getProfileInfo() async {
    ProfileModel? profileModel = ProfileModel();

    final String? token = SharedPrefService.getToken() ?? '';
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'me',
      data: const NetworkRequestBody.json(
        {},
      ),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final response = await networkService.execute(
      request,
      ProfileModel
          .fromJson, // <- Function to convert API response to your model
    );

    Get.log('res  is' + response.toString());
    response.maybeWhen(
        ok: (response) {
          profileModel = response as ProfileModel;
          return profileModel;
        },
        orElse: () {});
    return profileModel;
  }

  Future<UpdateProfileModel?> updateProfileInfo(
      {required String first_name,
      required String last_name,
      required String mobile,
      required String email}) async {
     UpdateProfileModel updateProfileModel = UpdateProfileModel();

    final String? token = SharedPrefService.getToken() ?? '';
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'updateProfile',
        data: NetworkRequestBody.json(
          {
            'first_name': first_name,
            'last_name': last_name,
            'mobile': mobile,
            'email': email
          },
        ),
        headers: {'Authorization': 'Bearer $token'});
    final response = await networkService.execute(
      request,
      UpdateProfileModel
          .fromJson, // <- Function to convert API response to your model
    );
    Get.log('updated   =>' + response.toString());
    response.maybeWhen(
        ok: (response) {
          updateProfileModel = response;
        },
        orElse: () {});
    return updateProfileModel;
  }
}
