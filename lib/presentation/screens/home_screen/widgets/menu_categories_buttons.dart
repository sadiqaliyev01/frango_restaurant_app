import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class MenuCategoriesButtons extends StatelessWidget {
  const MenuCategoriesButtons({super.key, required this.foodName, this.onTap});

  final String foodName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        foodName,
        style: const TextStyle(
          color: AppColors.primaryYellow,
          fontSize: 16,
        ),
      ),
    );
  }
}
