import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        appBar: AppBar(
          titleSpacing: 90,
          backgroundColor: AppColors.primaryBlack,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          title: const Text(
            AppStrings.notificationsPageText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: Text(
            'No notifications right now',
            style: TextStyle(color: AppColors.lightGray),
          ),
        ),
      ),
    );
  }
}
