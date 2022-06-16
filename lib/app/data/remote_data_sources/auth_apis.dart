import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nourish_sa/app/core/values/app_constants.dart';
import 'package:nourish_sa/app/data/models/login_model.dart';

class AuthApis {
  LoginModel? loginModel ;
  Future<LoginModel?> loginUser(String mobile) async {
    Map<String, dynamic> ?map = {
      'mobile': mobile,
    };
    Dio dio = Dio();
    try {
      Dio dio = Dio();
      dio.interceptors
        ..add(
            DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())))
        ..add(dioLoggerInterceptor);

      final response = await dio.post(
          AppConstants.kBaseUrl + "api/auth/login",
          data: map
      );
      loginModel=LoginModel.fromJson(response.data) as LoginModel;
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      if(e.response?.statusCode==401){
        Get.snackbar("Unknown Network error", 'Unauthorized');
      }else{
        Get.snackbar("Unknown Network error", e.message.toString());
        // return null;
      }
    }
  }
}
