import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isHome;
  bool? isSplash;

  void getInstanceHome() async {
    SharedPreferences prefsHome = await SharedPreferences.getInstance();
    isHome = prefsHome.getBool("Home");
    setState(() {});
  }

  void getInstanceSplash() async {
    SharedPreferences prefsSplash = await SharedPreferences.getInstance();
    isSplash = prefsSplash.getBool('Splash');
  }

  @override
  void initState() {
    super.initState();
    getInstanceHome();
    getInstanceSplash();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isHome == true ? const HomeScreen() : const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
