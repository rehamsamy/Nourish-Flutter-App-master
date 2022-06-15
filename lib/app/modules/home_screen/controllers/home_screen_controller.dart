import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nourish_sa/app/data/models/categories_model.dart';
import 'package:nourish_sa/app/data/models/home_package_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
class HomeScreenController extends GetxController {
GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController search = TextEditingController();
  List<CategoryItem> categoriesList=[];
  List<WeeklyItem> homePackagesList=[];
  bool isLoading=false;

@override
  void onInit() {
  handleIsLoading(true);
  getHomeCategories();
  handleIsLoading(true);
  getHomePackages();
  }

  Future<List<CategoryItem>?> getHomeCategories() async {
  Dio dio = Dio();
  try {
    Dio dio = Dio();
    dio.interceptors
      ..add(
          DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
      ..add(dioLoggerInterceptor);

    final response = await dio.get(
        AppConstants.kBaseUrl + "api/categories",

    );
    CategoriesModel model=CategoriesModel.fromJson(response.data);
    categoriesList=model.categoryData?.categoriesList??[] ;
    Get.log('size is s'+categoriesList.length.toString());
    handleIsLoading(false);
   return categoriesList;
  } on DioError catch (e) {
    Get.snackbar("Unknown Network error", e.message.toString());
    return null;
  }
}


Future<List<WeeklyItem>?> getHomePackages() async {
  Dio dio = Dio();
  try {
    Dio dio = Dio();
    dio.interceptors
      ..add(
          DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
      ..add(dioLoggerInterceptor);

    final response = await dio.get(
      AppConstants.kBaseUrl + "api/homePackages",

    );
    HomePackageModel model=HomePackageModel.fromJson(response.data);
    homePackagesList=model.data!.weekly??[] ;
     handleIsLoading(false);
    return homePackagesList;
  } on DioError catch (e) {
    Get.snackbar("Unknown Network error", e.message.toString());
    return null;
  }
}

handleIsLoading(bool val){
  isLoading=val;
  update();
}



}
