import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/page_view_builder.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/skip_button.dart';
import 'package:frango_restaurant_app/presentation/widgets/dot_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frango_restaurant_app/data/models/local/onboard_model.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  Future<void> _checkIfOnboardingCompleted(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? completed = prefs.getBool('onboardingCompleted');
    if (completed == true) {
      _navigateToHome(context);
    }
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> _completeOnboarding(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    _navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardModel> onboards = OnboardModel.onboardItems;
    final PageController pageController = PageController(initialPage: 0);

    _checkIfOnboardingCompleted(context);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          PageViewBuilder(
            pageController: pageController,
          ),
          const SizedBox(height: 20),
          DotIndicator(
            pageController: pageController,
            itemCount: onboards.length,
          ),
          const SizedBox(height: 20),
          SkipButton(
            onPressed: () => _completeOnboarding(context),
          )
        ],
      ),
    );
  }
}
