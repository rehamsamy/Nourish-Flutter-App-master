
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
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'categories',
      data: const NetworkRequestBody.json(
        {},
      ),
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
          categoriesList=model.categoryData?.categoriesList;
          return model.categoryData?.categoriesList;
        },
        orElse: () {});
    return categoriesList;
  }

  Future<List<WeeklyItem>?> getHomePackages() async {
    List<WeeklyItem> weeklyList=[];
    const request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: 'homePackages',
      data: const NetworkRequestBody.json(
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

      print('cccc'+response.obs.toString());
    response.maybeWhen(
        ok: (authResponse) {
          print('mmmmm  '+authResponse.data.weekly.toString());
          List<WeeklyItem> list=authResponse.data.weekly as List<WeeklyItem> ;
          print('mmmmm  '+list.length.toString());
          weeklyList=list;
          return list;
        },
        orElse: () {});
    return weeklyList;
      // response.mapOrNull(
    //   ok:(x){
    //     print('cccc2 '+x.data.data.weekly.toString());
    //     List<WeeklyItem>? res=x.data.data.weekly;
    //     print('cccc'+response.toString());
    //     return res;
    //   }
    // )  ;
      //   response.obs;
  }
}
