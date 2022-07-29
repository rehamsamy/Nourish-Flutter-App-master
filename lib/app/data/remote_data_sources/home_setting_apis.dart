import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:nourish_sa/app/data/models/home_setting_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';

class HomeSettingApis {
  Future<HomeSettingModel?> getHomeSetting() async {
    HomeSettingModel homePackageModel =HomeSettingModel();
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'homeSettings',
      data: NetworkRequestBody.json(
        {},
      ),
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