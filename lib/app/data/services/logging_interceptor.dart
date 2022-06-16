import 'package:dio/dio.dart';
import 'package:get/utils.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Get.log("<-- HTTP INFORMATION-->");
    Get.log("--> ${options.headers.toString().replaceAll(',', '\n')}");
    Get.log("--> ${options.method}");
    Get.log("--> ${options.path}");
    Get.log("<-- END HTTP -->");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Get.log(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
      (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        Get.log(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      Get.log(response.data.toString());
    }

    Get.log("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Get.log("<-- Error -->");
    Get.log("Error->${err.error}");
    Get.log("Message->${err.message}");
    super.onError(err, handler);
  }
}