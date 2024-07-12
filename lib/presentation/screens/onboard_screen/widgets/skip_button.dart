import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryYellow),
      child: const Text(
        "Ötürün",
        style: TextStyle(
          color: AppColors.primaryBlack,
        ),
      ),
    );
  }
}
