import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/utils/controllers/user_controller.dart';

import 'custom_dio_interceptor.dart';

final authDio = Dio()
  ..interceptors
      .add(AwesomeDioInterceptor()); // Dio-nu cagiranda interceptor yaranacaq

final clientDio = Dio(
  BaseOptions(
    headers: {'Authorization': 'Bearer ${UserController.accessToken}'},
  ),
)
  ..interceptors.add(AwesomeDioInterceptor())
  ..interceptors.add(CustomDioInterceptor());
