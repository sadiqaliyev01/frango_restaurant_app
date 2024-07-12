import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.pageController, required this.itemCount});

  final PageController pageController;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmoothPageIndicator(
        controller: pageController,
        count: itemCount,
        effect: const ExpandingDotsEffect(
          activeDotColor: AppColors.primaryYellow,
          dotColor: AppColors.black,
          dotWidth: 16,
        ),
        // WormEffect(
        //   activeDotColor: AppColors.primaryYellow,
        //   dotColor: AppColors.primaryBlack,
        //   dotWidth: 30,
        // ),
      ),
    );
  }
}
