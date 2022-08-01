import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/logging_interceptor.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
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
    required List selectedMeals,
  }) async {
    CreatePackageModel? packageModel ;
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    logger.wtf(goal);
    Map<String,dynamic>  days= {'saturday': 1};
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



    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: 'updateAdditionalData',
      data: NetworkRequestBody.json(map),
        headers: {
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTkyNzk4NzEsImV4cCI6MTY1OTM2NjI3MSwibmJmIjoxNjU5Mjc5ODcxLCJqdGkiOiJhbW0xVFdYd0pjaWcwaUtrIiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.hVK4vxqMxheKSo_mV-AiBGkpP9tiB2bcLsdH8bODa3U',
        }
    );

    final response = await networkService.execute(
      request,
      CreatePackageModel
          .fromJson, // <- Function to convert API response to your model
    );

    Get.log('cretate package result ====>'+response.toString());
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
