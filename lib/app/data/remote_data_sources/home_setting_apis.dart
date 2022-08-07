import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/home_setting_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class HomeSettingApis {
  Future<HomeSettingModel?> getHomeSetting() async {
    final String? token = SharedPrefService.getToken() ?? '';

    HomeSettingModel homePackageModel = HomeSettingModel();
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'homeSettings',
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
      HomeSettingModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          homePackageModel = model;
          return homePackageModel;
        },
        orElse: () {});
    return homePackageModel;
  }
}
