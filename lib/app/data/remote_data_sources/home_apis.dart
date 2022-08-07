import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/services/shared_pref.dart';
import '../services/network_service.dart/dio_network_service.dart';

class HomeApis {
  Future<List<CategoryItem>?> getHomeCategories() async {
    final String? token = Get.find<SharedPrefService>().getToken();

    List<CategoryItem> categoriesList = [];
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'categories',
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
      CategoriesModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (model) {
          categoriesList = model.categoryData?.categoriesList;
          return model.categoryData?.categoriesList;
        },
        orElse: () {});
    return categoriesList;
  }

  Future<List<PackageItem>?> getHomePackages() async {
    final String? token = Get.find<SharedPrefService>().getToken();

    List<PackageItem> weeklyList = [];
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'homePackages',
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
      HomePackageModel
          .fromJson, // <- Function to convert API response to your model
    );

    response.maybeWhen(
        ok: (authResponse) {
          weeklyList.clear();
          HomePackageModel? model = authResponse;
          List<PackageItem>? list =
              authResponse.data.weekly as List<PackageItem>;
          weeklyList = list;
          int? length = model?.data?.monthly?.length;
          for (int i = 0; i < length!; i++) {
            weeklyList.add((model?.data?.monthly?[i]) as PackageItem);
          }
          //
          return weeklyList;
        },
        orElse: () {});
    return weeklyList;
  }
}
