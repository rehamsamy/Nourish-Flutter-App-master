import 'package:get/get.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/package_detail_model.dart';
import 'package:nourish_sa/app/data/models/package_model.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/dio_network_service.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';

class PackageApis {
  Future<List<PackageItem>?> getPackagesAccordingType(
      String packageType) async {
    final String? token = Get.find<SharedPrefService>().getToken();

    List<PackageItem>? packagesList = [];
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'packages/?type=$packageType',
      data: const NetworkRequestBody.json(
        {
          // 'type':packageType
        },
      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      PackageModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );

    response.maybeWhen(
        ok: (response) {
          PackageModel model = response;
          packagesList = model.data?.packagedata;
          Get.log('size of package  ee');
          return packagesList;
        },
        orElse: () {});
    return packagesList;
  }

  Future<PackageDetailModel?> getPackageDetail(int packageId) async {
    final String? token = Get.find<SharedPrefService>().getToken();

    PackageDetailModel? detailModel;
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'packageDetails/$packageId',
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
      PackageDetailModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );

    response.maybeWhen(
        ok: (response) {
          detailModel = response;
          return detailModel;
        },
        orElse: () {});
    return detailModel;
  }
}
