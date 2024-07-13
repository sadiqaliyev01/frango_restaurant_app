import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator(
      {super.key,
      required this.pageController,
      required this.itemCount,
      required this.activeDotColor,
      required this.dotColor});

  final PageController pageController;
  final int itemCount;
  final Color activeDotColor;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SmoothPageIndicator(
        controller: pageController,
        count: itemCount,
        effect: ScrollingDotsEffect(
          activeDotColor: activeDotColor,
          dotColor: dotColor,
        ),
      ),
    );
  }
}
