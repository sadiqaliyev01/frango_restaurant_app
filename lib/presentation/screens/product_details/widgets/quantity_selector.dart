import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove,
            color: AppColors.primaryYellow,
          ),
          onPressed: quantity > 1 ? onDecrement : null,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          quantity.toString(),
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryYellow),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: AppColors.primaryYellow,
          ),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
