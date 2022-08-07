import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    printTime: true,
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
  handler.next(error); //continue

  logger.wtf("---------------------------------------");
  logger.wtf("| [DIO] Error: ${error.error}: ${error.response?.toString()}" +
      error.type.toString() +
      error.message);
  logger.wtf(
      "└------------------------------------------------------------------------------");
});
