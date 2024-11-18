import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class SettingsAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const SettingsAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primaryYellow),
      ),
      content: Text(
        content,
        style: const TextStyle(color: AppColors.lightGray),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            AppStrings.warningCancel,
            style: TextStyle(color: AppColors.primaryYellow),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: const Text(
            AppStrings.warningDelete,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      backgroundColor: AppColors.primaryBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
          color: AppColors.primaryYellow,
          width: 0.7,
        ),
      ),
    );
  }
}
