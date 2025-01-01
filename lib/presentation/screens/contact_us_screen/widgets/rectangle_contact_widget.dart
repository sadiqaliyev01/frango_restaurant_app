import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class RectangleContactWidget extends StatelessWidget {
  final IconData iconLeading;
  final IconData iconTrailing;
  final String text;
  final VoidCallback onTap;

  const RectangleContactWidget({
    super.key,
    required this.iconLeading,
    required this.iconTrailing,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.865;
    double height = MediaQuery.of(context).size.height * 0.08;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Icon(
                iconLeading,
                size: 28,
                color: AppColors.primaryBlack,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                iconTrailing,
                size: 25,
                color: AppColors.primaryBlack,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
