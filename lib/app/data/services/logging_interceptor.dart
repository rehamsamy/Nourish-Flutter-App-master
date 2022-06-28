import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;
  var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 200, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp
        ),
  );
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.v("""<--------------------- HTTP INFORMATION -------------------->
    headers: --> ${options.headers.toString().replaceAll(',', '\n')}
    method: --> ${options.method}
    path: --> ${options.path}
    queryParameters: --> ${options.queryParameters.toString().replaceAll(',', '\n')}
    data: --> ${options.data.toString().replaceAll(',', '\n')}
    <--------------------- HTTP INFORMATION -------------------->""");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.v(
        """<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}""");
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        logger.i(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      logger.i(response.data.toString());
    }

    logger.v("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.wtf("""
   !!!!!!<-- Error -->!!!!!!
   Error->${err.error}
   Message->${err.message}
   """);
    super.onError(err, handler);
  }
}
