import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomSectionDivider extends StatelessWidget {
  final String title;

  const CustomSectionDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.primaryYellow,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.primaryYellow,
              fontSize: 16,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.primaryYellow,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
