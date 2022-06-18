import 'package:dio/dio.dart';
import 'package:nourish_sa/app/data/services/network_service.dart/network_response.dart';

import 'network_request.dart';

class NetworkService {
  NetworkService({
    required this.baseUrl, // Base service url
    dioClient, // Prepared Dio instance could be injected
    httpHeaders, // Global headers could be provided as well
  })  : _dio = dioClient,
        _headers = httpHeaders ?? {};
  Dio? _dio;
  final String baseUrl;
  final Map<String, String> _headers;
  Future<Dio> _getDefaultDioClient() async {
    // Global http header
    _headers['content-type'] = 'application/json; charset=utf-8';
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.headers = _headers
      ..options.connectTimeout = 5000 // 5 seconds
      ..options.receiveTimeout = 3000; // 3 seconds

    return dio;
  }

  // Generic type and parser are used to properly deserialise JSON
  Future<NetworkResponse<Model>?> execute<Model>(
    NetworkRequest request,
    Model Function(Map<String, dynamic>) parser, {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio ??= await _getDefaultDioClient();
    // 1. Prepare the request
    // 2. Execute it
    // 3. Return parsed result or error
  }
}
