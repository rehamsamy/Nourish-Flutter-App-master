import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/logging_interceptor.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class CreatePackageApis {
  Future<CreatePackageModel?> createPackage({
    required String gender,
    required int experience_id,
    required String date_of_birth,
    required int height,
    required String height_unit,
    required int weight,
    required String weight_unit,
    required String goal,
    required List selectedMeals,
  }) async {
    CreatePackageModel? packageModel;
    final String? token = SharedPrefService.getToken() ?? '';
    logger.wtf(goal);
    Map<String, dynamic> days = {'saturday': 1};
    Map<String, dynamic> map = {
      'gender': gender,
      'experience_id': experience_id,
      'date_of_birth': date_of_birth,
      'height': height,
      'height_unit': height_unit,
      'weight': weight,
      'weight_unit': weight_unit,
      'goal': goal,
      'your_meals': selectedMeals,
      //  'your_meals': days
    };

    Get.log('selected meals  => ' + selectedMeals.toString());

    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'updateAdditionalData',
      data: NetworkRequestBody.json(map),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final response = await networkService.execute(
      request,
      CreatePackageModel
          .fromJson, // <- Function to convert API response to your model
    );

    // Execute a request and convert response to your model:

    response.maybeWhen(
        ok: (response) {
          packageModel = response;
          return packageModel;
        },
        badRequest: (info) {},
        orElse: () {});
    return packageModel;
  }
}
