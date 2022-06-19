import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import '../services/network_service.dart/dio_network_service.dart';

class HomeApis {
  Future<List<CategoryItem>?> getHomeCategories() async {
    List<CategoryItem> categoriesList = [];
    try {
      Dio dio = Dio();
      dio.interceptors.add(dioLoggerInterceptor);

      final response = await dio.get(
        AppConstants.kBaseUrl + "api/categories",
      );
      CategoriesModel model = CategoriesModel.fromJson(response.data);
      categoriesList = model.categoryData?.categoriesList ?? [];
      Get.log('size is s' + categoriesList.length.toString());
      return categoriesList;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }

  Future<List<WeeklyItem>?> getHomePackages() async {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'homePackages',
      data: NetworkRequestBody.json(
        {},
      ),
    );
    // Execute a request and convert response to your model:
    final response = await networkService.execute(
      request,
      HomePackageModel
          .fromJson, // <- Function to convert API response to your model
      onReceiveProgress: (count, total) {},
      onSendProgress: (count, total) {},
    );
    response.maybeWhen(
        ok: (authResponse) {
          return authResponse.data.weekly;
        },
        orElse: () {});
  }
}
