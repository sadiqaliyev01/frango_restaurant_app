import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/remote/services/local/login_local_service.dart';

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginLocalService = locator<LoginLocalService>();

    var box = Hive.box('settings');
    bool isOnboardingCompleted =
        box.get('onboardingCompleted', defaultValue: false);

    return BlocProvider(
      create: (context) => LoginCubit(
        locator(),
      ),
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
