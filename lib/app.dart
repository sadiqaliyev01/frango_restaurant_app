import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/home/home_cubit.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('settings');
    bool isOnboardingCompleted =
        box.get('onboardingCompleted', defaultValue: false);

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isOnboardingCompleted ? const HomeScreen() : const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
