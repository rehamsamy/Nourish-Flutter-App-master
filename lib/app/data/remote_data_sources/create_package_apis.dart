import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/create_package_model.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import '../services/network_service.dart/dio_network_service.dart';

class CreatePackageApis {
  Future<CreatePackageModel?> createPackage(
      {required String gender,
      required int experience_id,
      required String date_of_birth,
      required int height,
      required String height_unit,
      required int weight,
      required String weight_unit,
      required String goal,
      required int meals}) async {
    CreatePackageModel? packageModel = CreatePackageModel();
    final String? token = Get.find<SharedPrefService>().getToken() ?? '';
    Map<String, dynamic> map = {
      'gender': gender,
      'experience_id': experience_id,
      'date_of_birth': date_of_birth,
      'height': height,
      'height_unit': height_unit,
      'weight': weight,
      'weight_unit': weight_unit,
      'goal': goal,
      'your_meals[]':[1].toString()
      // 'your_meals[saturday]': meals
    };
    Get.log('ccccccc 1 ' +
        gender.toString() +
        ' ===  ' +
        experience_id.toString() +
        '  ===  ' +
        date_of_birth.toString() +
        '---- ' +
        height.toString() +
        ' ===  ' +
        height_unit.toString() +
        '  === ' +
        weight.toString() +
        '-===' +
        weight_unit.toString() +
        '====' +
        goal.toString() +
        '----' +
        meals.toString());
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: 'updateAdditionalData',
        data: NetworkRequestBody.json(map),
        headers: {
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLmVhdC1ub3VyaXNoLmNvbVwvYXBpXC9hdXRoXC92ZXJpZnlNb2JpbGVPVFAiLCJpYXQiOjE2NTY3MDkzMTYsImV4cCI6MTY1Njc5NTcxNiwibmJmIjoxNjU2NzA5MzE2LCJqdGkiOiJEMmFUQWJNV0wwS0Z2WGVwIiwic3ViIjo0LCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LFCLQ-_k1gj8TfGrdqHR366rsg_jNSPCy3JbX_7eQBk',
        });

    Get.log('ccccccc 1 ' + request.path.toString());
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      CreatePackageModel
          .fromJson, // <- Function to convert API response to your model
    );
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
