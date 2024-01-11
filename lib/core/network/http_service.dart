
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vintuff_thrift/config/constants/api_endpoints.dart';


import 'dio_error_interceptor.dart';

final httpServiceProvider = Provider.autoDispose<Dio>((ref) {
  final dio = Dio();

  dio
    ..options.baseUrl = ApiEndpoints.baseUrl
    ..options.connectTimeout = ApiEndpoints.connectionTimeout
    ..options.receiveTimeout = ApiEndpoints.receiveTimeout
    ..interceptors.add(DioErrorInterceptor())
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true))
    ..options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

  return dio;
});
