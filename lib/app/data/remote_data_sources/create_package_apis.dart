import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

import '../services/network_service.dart/dio_network_service.dart';

class CreatePackageApis {
  Future<CreatePackageModel?> createPackage({required String gender,
                                     required int experience_id,
                                     required String date_of_birth,
                                     required int height,
                                      required String height_unit,
                                      required int weight,
                                      required String weight_unit,
                                      required String goal,
                                      required List<String> meals
                                     }) async {
    CreatePackageModel? packageModel=CreatePackageModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    Map<String,dynamic>  map={
      'gender':gender,
      'experience_id':experience_id,
       'date_of_birth':date_of_birth,
      'height':height,
      'height_unit':height_unit,
      'weight':weight,
      'weight_unit':weight_unit,
      'goal':goal,
      'your_meals[saturday]':meals
    };
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'changeOrderPeriod',
        data: NetworkRequestBody.json(map),
        headers: {
          'Authorization':'Bearer $token',
        }
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      CreatePackageModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          packageModel = model ;
          return packageModel;
        },
        orElse: () {});
    return packageModel;
  }
}