import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
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
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  logger.i(
      "| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
  logger.i(
      "└------------------------------------------------------------------------------");
  handler.next(response);
  // return response; // continue
}, onError: (DioError error, handler) async {
  logger.wtf("| [DIO] Error: ${error.error}: ${error.response?.toString()}");
  logger.wtf(
      "└------------------------------------------------------------------------------");
  handler.next(error); //continue
});
