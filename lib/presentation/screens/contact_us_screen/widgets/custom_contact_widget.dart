import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomContactWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? additionalText;
  final TextStyle? additionalTextStyle;
  final VoidCallback onTap;

  const CustomContactWidget({
    super.key,
    required this.icon,
    required this.text,
    this.additionalText,
    this.additionalTextStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.4;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primaryYellow,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: AppColors.primaryBlack,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            if (additionalText != null) ...[
              const SizedBox(height: 8),
              Text(
                additionalText!,
                style: additionalTextStyle ??
                    const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
