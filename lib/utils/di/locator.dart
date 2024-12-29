import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/data/remote/contractor/login_contractor.dart';
import 'package:frango_restaurant_app/data/remote/repositories/login_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/login_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import '../../data/remote/services/local/local_login_service.dart';


final GetIt locator = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {

  final Box<String> box = await Hive.openBox('loginBox');
  locator.registerLazySingleton<LoginLocalService>(() => LoginLocalService(box));
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton(() => LoginCubit(locator(), locator()));
  locator.registerLazySingleton<LoginContractor>(()=> LoginRepository(locator()));
}
