import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      'Authorization': 'Bearer YOUR_API_TOKEN',
    };
    log(options.data);
    log(options.headers.toString());
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.data);
    log(response.statusCode.toString());
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}
}
