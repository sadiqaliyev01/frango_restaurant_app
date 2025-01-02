import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/onboard_screen.dart';
import 'package:frango_restaurant_app/utils/constants/app_assets.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/remote/services/local/login_local_service.dart';
import '../../../utils/di/locator.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      final loginLocalService = locator<LoginLocalService>();
      var box = Hive.box('settings');
      bool isOnboardingCompleted =
      box.get('onboardingCompleted', defaultValue: false);
      bool isLoggedIn = loginLocalService.loginResponse != null;

      if (!isOnboardingCompleted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardScreen(),
          ),
        );
      } else if (isLoggedIn && loginLocalService.isTokenValid()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppAssets.frangoLogo),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppStrings.frangoSlogan,
            style: TextStyle(
              color: AppColors.primaryYellow,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}