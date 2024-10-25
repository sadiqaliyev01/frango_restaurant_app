import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class CustomUPIPaymentBanner extends StatelessWidget {
  final List<String> upiMethods;

  const CustomUPIPaymentBanner({
    super.key,
    required this.upiMethods,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var method in upiMethods) ...[
            Row(
              children: [
                _buildMethodLogo(method),
                const SizedBox(width: 10.0),
                Text(
                  method,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
          const Divider(color: AppColors.gray),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle, color: Colors.white),
                iconSize: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  log("add upi button pressed");
                },
                label: const Text(
                  AppStrings.addNewUpiID,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMethodLogo(String method) {
    if (method == "Google Pay") {
      return Image.asset(
        'assets/png/google_pay_logo.png',
        width: 40,
        height: 40,
      );
    } else {
      return Container(width: 40, height: 40);
    }
  }
}