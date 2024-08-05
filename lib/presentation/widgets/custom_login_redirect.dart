import 'package:flutter/material.dart';

class CustomLoginRedirectText extends StatelessWidget {
  final String normalText;
  final String highlightedText;
  final VoidCallback onTap;
  final Color normalTextColor;
  final Color highlightedTextColor;

  const CustomLoginRedirectText({
    required this.normalText,
    required this.highlightedText,
    required this.onTap,
    this.normalTextColor = Colors.white,
    this.highlightedTextColor = Colors.red,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: normalText,
              style: TextStyle(
                color: normalTextColor,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: highlightedText,
              style: TextStyle(
                color: highlightedTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
