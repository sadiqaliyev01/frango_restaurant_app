import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_interceptor.dart';

final dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    headers: {
      'Accept': 'application/json',
    },
  ),
)..interceptors.add(DioInterceptor()); // Dio-nu cagiranda interceptor yaranacaq