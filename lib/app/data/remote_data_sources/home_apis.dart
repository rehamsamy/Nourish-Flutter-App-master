import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';

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
    List<WeeklyItem> homePackagesList = [];
    Dio dio = Dio();
    try {
      Dio dio = Dio();
      dio.interceptors.add(dioLoggerInterceptor);

      final response = await dio.get(
        AppConstants.kBaseUrl + "api/homePackages",
      );
      HomePackageModel model = HomePackageModel.fromJson(response.data);
      homePackagesList = model.data!.weekly ?? [];
      return homePackagesList;
    } on DioError catch (e) {
      Get.snackbar("Unknown Network error", e.message.toString());
      return null;
    }
  }
}
