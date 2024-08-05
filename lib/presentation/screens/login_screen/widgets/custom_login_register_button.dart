import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomLoginRegisterButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String? svgIconPath;

  const CustomLoginRegisterButton({
    required this.buttonText,
    required this.onPressed,
    required this.backgroundColor,
    this.svgIconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIconPath != null) ...[
              SvgPicture.asset(
                svgIconPath!,
                height: 20,
              ),
              const SizedBox(width: 10),
            ],
            Text(
              buttonText,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
