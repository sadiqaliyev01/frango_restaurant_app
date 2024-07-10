import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frango_restaurant_app/data/models/local/onboard_model.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart'; // HomeScreen'i içe aktarın
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/onboard_description_and_style.dart';
import 'package:frango_restaurant_app/presentation/screens/onboard_screen/widgets/onboard_title_and_style.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController pageController;
  int currentPage = 0;
  List<OnboardModel> onboards = OnboardModel.onboardItems;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
    _checkIfOnboardingCompleted();
  }

  void _checkIfOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? completed = prefs.getBool('onboardingCompleted');
    if (completed == true) {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    _navigateToHome();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboards.length,
              itemBuilder: (context, index) {
                final items = onboards[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),

                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          items.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OnboardTitleAndStyle(
                      title: items.title,
                    ),
                    const SizedBox(height: 20),
                    OnboardDescriptionAndStyle(
                      description: items.description,
                    ),
                  ],
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: pageController,
            count: onboards.length,
            effect: const WormEffect(
              activeDotColor: AppColors.primaryYellow,
              dotColor: AppColors.primaryBlack,
              dotWidth: 30,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _completeOnboarding,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryYellow),
            child: const Text(
              "Ötürün",
              style: TextStyle(
                color: AppColors.primaryBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
