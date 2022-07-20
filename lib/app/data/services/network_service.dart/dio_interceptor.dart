/* import 'package:dio/dio.dart';
import 'package:nourish_sa/app/data/remote_data_sources/auth_apis.dart';

class DioTokenInterceptor extends Interceptor {

  //refresh token if got 401 error
  @override
  Future onResponse(Response response, handler)  async {
    if (response.statusCode == 401) {
      //refresh token
       await AuthApis().refreshToken();
      //retry request
       return await retry();
    }
    return response;
  }
}
 */