import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

import 'dio_interceptor.dart';


final authDio = Dio()
  ..interceptors
      .add(AwesomeDioInterceptor()); // Dio-nu cagiranda interceptor yaranacaq

final clientDio = Dio()..interceptors.add(AwesomeDioInterceptor())..interceptors.add(CustomDioInterceptor());