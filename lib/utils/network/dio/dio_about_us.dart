import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/data/remote/repositories/about_us_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/about_us_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio(BaseOptions(baseUrl: 'http://134.122.65.76:8080/api'));
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<AboutUsService>(AboutUsService(dio));
  getIt.registerSingleton<AboutUsRepository>(
      AboutUsRepository(getIt<AboutUsService>()));
}
