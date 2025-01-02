import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/page_view_builder.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/skip_button.dart';
import 'package:frango_restaurant_app/presentation/widgets/dot_indicator.dart';
import 'package:frango_restaurant_app/data/models/local/onboard_model.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    var box = Hive.box('settings');
    await box.put('onboardingCompleted', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardModel> onboards = OnboardModel.onboardItems;
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Column(
        children: [
          Expanded(
            child: PageViewBuilder(
              pageController: pageController,
            ),
          ),
          const SizedBox(height: 20),
          DotIndicator(
            pageController: pageController,
            itemCount: onboards.length,
            activeDotColor: AppColors.primaryYellow,
            dotColor: AppColors.white,
          ),
          const SizedBox(height: 20),
          SkipButton(
            onPressed: () => _completeOnboarding(context),
          ),
        ],
      ),
    );
  }
}
