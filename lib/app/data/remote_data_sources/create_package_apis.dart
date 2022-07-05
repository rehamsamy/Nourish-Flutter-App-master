import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import '../services/network_service.dart/dio_network_service.dart';
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
    int? breakfastMeals,
    int? launchMeals,
    int? dinnerMeals,
  }) async {
    CreatePackageModel? packageModel = CreatePackageModel();
    Map<String, dynamic> map = {
      'gender': gender,
      'experience_id': experience_id,
      'date_of_birth': date_of_birth,
      'height': height,
      'height_unit': height_unit,
      'weight': weight,
      'weight_unit': weight_unit,
      'goal': goal,
   'your_meals': [1]
      // 'your_meals[0]': breakfastMeals,
      // 'your_meals[1]': launchMeals,
      // 'your_meals[2]': dinnerMeals,

      // 'your_meals[saturday]': meals
    };

    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'updateAdditionalData',
      data: NetworkRequestBody.json(map),
     );

    Get.log('ccccccc 1 ' + request.path.toString());
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      CreatePackageModel
          .fromJson, // <- Function to convert API response to your model
    );
    Get.log('ccccccc 2' + response.toString());
    response.maybeWhen(
        ok: (model) {
          Get.log('ccccccc 2' + model.toString());
          packageModel = model;
          return packageModel;
        },
        conflict: (err) {
          print('err' + err.toString());
        },
        orElse: () {});
    return packageModel;
  }
}
