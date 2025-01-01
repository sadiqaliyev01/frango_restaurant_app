import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/data/remote/contractor/login_contractor.dart';

import '../../../data/remote/services/local/local_login_service.dart';
import '../../di/locator.dart';

class CustomDioInterceptor extends QueuedInterceptor {
  final _loginLocalService = locator<LoginLocalService>();
  final _loginContract = locator<LoginContractor>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('Error: ${err.response?.statusCode}');
    handler.next(err);
  }
}
