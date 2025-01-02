import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/data/remote/contractor/login_contractor.dart';

import '../../../data/remote/services/local/login_local_service.dart';
import '../../controllers/user_controller.dart';
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
    if (err.response?.statusCode == 401) {
      UserController.logout();
    }
    handler.next(err);
  }
}
