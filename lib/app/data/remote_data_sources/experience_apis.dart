import 'package:get/get_core/src/get_main.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/experience_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';

class ExperienceApis{
  Future<List<ExperienceItem>?> getExperience() async {
    List<ExperienceItem> ?list;
    ExperienceModel experienceModel=ExperienceModel();
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'getExperience',
      data: NetworkRequestBody.json(
        {},
      ),
      headers: null
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      ExperienceModel.fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          experienceModel=model;
          list=experienceModel.data;
          Get.log('cccc   '+(list?.length.toString()).toString());
          return list;
        },
        orElse: () {});
    return list;
  }


}
