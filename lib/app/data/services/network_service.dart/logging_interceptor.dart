import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 40,
    colors: true,
    printEmojis: true,
  ),
);
final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  handler.next(options); //continue
  String headers = "";
  options.headers.forEach((key, value) {
    headers += "| $key: $value";
  });

  logger.v(
      "┌------------------------------------------------------------------------------");
  logger.v('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
  logger.v(
      "├------------------------------------------------------------------------------");
}, onResponse: (Response response, handler) async {
  handler.next(response);
  logger.i(
      "| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  logger.i(
      "└------------------------------------------------------------------------------");

  // return response; // continue
}, onError: (DioError error, handler) async {
  /*if (error.response?.data != null) {
    if ((error.response?.statusCode == 401 ||
            error.response?.statusCode == 403) &&
        (token != null || token != "")) {
      AuthApis().refreshToken();
    } else if (error.response!.statusCode! > 500 ||
        error.response!.statusCode! == 404) {
      Get.to(() => const NetworkError());
    }
  }
*/
  handler.next(error); //continue

  logger.wtf("---------------------------------------");
  logger.wtf(
      "| [DIO] Error: ${error.error}: ${error.response?.toString()}", error);
  logger.wtf(
      "└------------------------------------------------------------------------------");
});
