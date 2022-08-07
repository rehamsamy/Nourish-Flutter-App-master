import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/experience_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class ExperienceApis {
  Future<List<ExperienceItem>?> getExperience() async {
    final String? token = Get.find<SharedPrefService>().getToken();

    List<ExperienceItem>? list;
    ExperienceModel experienceModel = ExperienceModel();
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'getExperience',
      data: const NetworkRequestBody.json(
        {},
      ),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      ExperienceModel
          .fromJson, // <- Function to convert API response to your model
    );
    response.maybeWhen(
        ok: (model) {
          experienceModel = model;
          list = experienceModel.data;
          Get.log('cccc   ' + (list?.length.toString()).toString());
          return list;
        },
        orElse: () {});
    return list;
  }
}
