Future<List<CategoryItem>?> getHomeCategories() async {
  Get.log('isLoading'+isLoading.toString());
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