import 'dart:convert';
import 'package:dio/src/form_data.dart' as ss;
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/logging_interceptor.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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
    final String? token = await Get.find<SharedPrefService>().getToken() ?? '';
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
    );

    final response = await networkService.execute(
      request,
      CreatePackageModel
          .fromJson, // <- Function to convert API response to your model
    );

    Get.log('cretate package result ====>' + response.toString());
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

  // Future<CreatePackageModel?> createPackage({
  //   required String gender,
  //   required int experience_id,
  //   required String date_of_birth,
  //   required int height,
  //   required String height_unit,
  //   required int weight,
  //   required String weight_unit,
  //   required String goal,
  //   required List selectedMeals,
  // }) async {
  //   CreatePackageModel? packageModel=CreatePackageModel() ;
  //   try {
  //     final String? token = Get.find<SharedPrefService>().getToken() ?? '';
  //
  //       Map<String, dynamic> map = {
  //         'gender': gender,
  //         'experience_id': experience_id,
  //         'date_of_birth': date_of_birth,
  //         'height': height,
  //         'height_unit': height_unit,
  //         'weight': weight,
  //         'weight_unit': weight_unit,
  //         'goal': goal,
  //         'your_meals': selectedMeals,
  //        //  'your_meals': days
  //       };
  //
  //
  //     var formData =  ss.FormData.fromMap({
  //       'gender': gender,
  //       'experience_id': experience_id,
  //       'date_of_birth': date_of_birth,
  //       'height': height,
  //       'height_unit': height_unit,
  //       'weight': weight,
  //       'weight_unit': weight_unit,
  //       'goal': goal,
  //       'your_meals': selectedMeals,
  //     });
  //     var url = "https://api.eat-nourish.com/api/updateAdditionalData";
  //     var response = await http.post(Uri.parse(url),
  //         body: jsonEncode(map),
  //     headers: {
  //               'Authorization': 'Bearer ${token}',
  //               "Accept":"application/json" ,
  //               'language':'en'
  //             }
  //     );
  //
  //     // var response = await Dio().post("https://api.eat-nourish.com/api/updateAdditionalData",
  //     //     data: formData,
  //     //     options: Options(headers: {
  //     //       'Authorization': 'Bearer ${token}',
  //     //       "Accept":"application/json" ,
  //     //       'language':'en'
  //     //     },));
  //
  //     Get.log('step  2 '+response.statusCode.toString());
  //  //   packageModel = (response.data['data']) as CreatePackageModel;
  //     if (response.statusCode == 200) {
  //       Get.log('step  3 ');
  //      // var res = json.decode(response.body);
  //       //  packageModel = (response.data['data']) as CreatePackageModel;
  //     Get.log('crete result 2 => '+packageModel.toString());
  //     return packageModel;
  //     }
  //   } on DioError catch (exception) {
  //     var statusCode = exception.response?.statusCode;
  //     Get.log('step  4 '+statusCode.toString());
  //   }
  // }

}
