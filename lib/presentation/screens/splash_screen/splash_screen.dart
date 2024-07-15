import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/onboard_screen.dart';
import 'package:frango_restaurant_app/utils/constants/app_assets.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardScreen(),
        ),
      );
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
