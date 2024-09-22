import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:hive/hive.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('settings');
    bool isOnboardingCompleted = box.get('onboardingCompleted', defaultValue: false);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isOnboardingCompleted ? const HomeScreen() : const  SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
