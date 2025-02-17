import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/about_us/about_us_cubit.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/cubits/reservation/reservation_cubit.dart';
import 'package:frango_restaurant_app/cubits/table/table_cubit.dart';
import 'package:frango_restaurant_app/cubits/verify_email/verify_email_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/about_us/about_us_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/contact_us_screen/contact_us_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/otp_screen/otp_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/reservation_screen/reservation_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/table_screen.dart/table_screen.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';

import '../../cubits/category_names/category_names_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/login/login_cubit.dart';
import '../../cubits/meal/meal_cubit.dart';
import '../../data/models/remote/table_response.dart';

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

  static Widget get signUp => BlocProvider<RegisterCubit>(
        create: (_) => locator(),
        child: const SignUpScreen(),
      );

  static Widget get login => BlocProvider<LoginCubit>(
        create: (_) => locator(),
        child: const LoginScreen(),
      );

  static Widget home(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider<MealCubit>(
          create: (_) => locator()..getMeals(),
        ),
        BlocProvider<CategoryNamesCubit>(
          create: (_) => locator()..getCategoryNames(),
        )
      ], child: const HomeScreen());

  static Widget reservation(
    BuildContext context, {
    required TableResponse table,
  }) =>
      MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<TableCubit>(),
          ), // TableCubit
          BlocProvider<ReservationCubit>(
            create: (_) => locator()..autoFillFromTable(table), // ReservationCubit
          ),
        ],
        child: const ReservationScreen(),
      );

  static Widget get aboutUs => const AboutUsScreen();

  static Widget get contactUs => BlocProvider<AboutUsCubit>(
        create: (_) => locator()..getAboutUs(),
        child: const ContactUsScreen(),
      );

  static Widget get tables => MultiBlocProvider(
        providers: [
          BlocProvider<TableCubit>(
            create: (context) => locator()..getTable(),
          ), // TableCubit
        ],
        child: const TableScreen(),
      );
}
