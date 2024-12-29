import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/cubits/about_us/about_us_cubit.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/data/remote/repositories/about_us_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/about_us_services.dart';
import 'package:frango_restaurant_app/data/remote/services/login_service.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('settings');
    bool isOnboardingCompleted =
        box.get('onboardingCompleted', defaultValue: false);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider<LoginCubit>(
          create: (context) => locator()
        ),
        BlocProvider(
          create: (context) => AboutUsCubit(
            AboutUsRepository(AboutUsService(Dio())),
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            isOnboardingCompleted ? const LoginScreen() : const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
}

