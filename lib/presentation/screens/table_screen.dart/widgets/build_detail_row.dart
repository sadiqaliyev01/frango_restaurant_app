import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class BuildDetailRow extends StatelessWidget {
  const BuildDetailRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlack,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.primaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}
