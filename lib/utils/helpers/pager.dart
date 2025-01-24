import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/cubits/verify_email/verify_email_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/otp_screen/otp_screen.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';

import '../../cubits/category_names/category_names_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/meal/meal_cubit.dart';
import '../../data/remote/repositories/category_names_repository.dart';
import '../../data/remote/repositories/meal_repository.dart';
import '../../data/remote/services/remote/category_names_service.dart';
import '../../data/remote/services/remote/meal_service.dart';

class Pager {
  Pager._();

  static Widget otp(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<RegisterCubit>()),
          BlocProvider<VerifyEmailCubit>(
            create: (_) => locator(),
          ),
        ],
        child: OtpScreen(),
      );

  static Widget home(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => MealCubit(
            MealRepository(
              MealService(),
            ),
          )..getMeals(),
        ),
        BlocProvider(
          create: (context) => CategoryNamesCubit(
            CategoryNamesRepository(
              CategoryNamesService(),
            ),
          )..getCategoryNames(),
        )
      ], child: const HomeScreen());
}
