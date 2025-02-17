import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/cubits/reservation/reservation_cubit.dart';
import 'package:frango_restaurant_app/cubits/table/table_cubit.dart';
import 'package:frango_restaurant_app/data/remote/contractor/about_us_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/category_names_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/login_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/register_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/reservation_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/table_contractor.dart';
import 'package:frango_restaurant_app/data/remote/contractor/verify_email_contractor.dart';
import 'package:frango_restaurant_app/data/remote/repositories/about_us_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/category_names_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/login_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/meal_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/register_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/reservation_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/table_repository.dart';
import 'package:frango_restaurant_app/data/remote/repositories/verify_email_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/about_us_service.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/category_names_service.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/login_service.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/meal_service.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/register_service.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/reservation_services.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/table_service.dart';

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import '../../cubits/about_us/about_us_cubit.dart';
import '../../cubits/category_names/category_names_cubit.dart';
import '../../cubits/meal/meal_cubit.dart';
import '../../cubits/verify_email/verify_email_cubit.dart';
import '../../data/remote/contractor/meal_contractor.dart';
import '../../data/remote/services/local/login_local_service.dart';
import '../../data/remote/services/remote/verify_email_service.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  final Box<String> box = await Hive.openBox('loginBox');

  // services
  locator
      .registerLazySingleton<LoginLocalService>(() => LoginLocalService(box));
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => VerifyEmailService());
  locator.registerLazySingleton(() => MealService());
  locator.registerLazySingleton(() => AboutUsService());
  locator.registerLazySingleton(() => CategoryNamesService());
  locator.registerLazySingleton(() => ReservationService());
  locator.registerLazySingleton(() => TableService());

  // contractors
  locator.registerLazySingleton<LoginContractor>(
      () => LoginRepository(locator<LoginService>()));

  locator.registerLazySingleton<RegisterContractor>(
      () => RegisterRepository(locator<RegisterService>()));

  locator.registerLazySingleton<VerifyEmailContractor>(
      () => VerifyEmailRepository(locator<VerifyEmailService>()));

  locator.registerLazySingleton<MealContractor>(
      () => MealRepository(locator<MealService>()));

  locator.registerLazySingleton<AboutUsContractor>(
      () => AboutUsRepository(locator<AboutUsService>()));

  locator.registerLazySingleton<CategoryNamesContractor>(
      () => CategoryNamesRepository(locator<CategoryNamesService>()));

  locator.registerLazySingleton<ReservationContractor>(
      () => ReservationRepository(locator<ReservationService>()));

  locator.registerLazySingleton<TableContractor>(
      () => TableRepository(locator<TableService>()));

  // cubits
  locator.registerLazySingleton(() => LoginCubit(locator()));
  locator.registerFactory(() => RegisterCubit(locator()));
  locator.registerFactory(() => VerifyEmailCubit(locator()));
  locator.registerFactory(() => MealCubit(locator()));
  locator.registerFactory(() => AboutUsCubit(locator()));
  locator.registerFactory(() => CategoryNamesCubit(locator()));
  locator.registerFactory(() => ReservationCubit(locator()));
  locator.registerFactory(() => TableCubit(locator()));
  // locator.registerLazySingleton(() => HomeCubit());
}
