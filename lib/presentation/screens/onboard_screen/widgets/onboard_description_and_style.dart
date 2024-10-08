import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class OnboardDescriptionAndStyle extends StatelessWidget {
  final String description;

  const OnboardDescriptionAndStyle({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        color: AppColors.primaryYellow,
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
