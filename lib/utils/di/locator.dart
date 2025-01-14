import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/data/remote/contractor/login_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/register_contractor.dart';
import 'package:frango_restaurant_app/data/remote/repositories/login_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/register_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/login_service.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/register_service.dart';

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import '../../data/remote/services/local/login_local_service.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  final Box<String> box = await Hive.openBox('loginBox');
  locator
      .registerLazySingleton<LoginLocalService>(() => LoginLocalService(box));
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton(() => LoginCubit(locator()));
  locator
      .registerLazySingleton<LoginContractor>(() => LoginRepository(locator()));

  locator.registerLazySingleton<RegisterService>(() => RegisterService());
  locator.registerLazySingleton(() => RegisterCubit());
  // locator.registerLazySingleton<RegisterContractor>(
  //     () => RegisterRepository(locator()));
}
