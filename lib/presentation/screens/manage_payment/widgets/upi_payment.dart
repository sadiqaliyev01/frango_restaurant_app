import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

class CustomUPIPaymentBanner extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelected;

  const CustomUPIPaymentBanner({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    List<String> upiMethods = ['Google Pay'];

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isLightMode ? Colors.white : Colors.grey[900],
        border:
            Border.all(color: isLightMode ? Colors.black : Colors.transparent),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          if (!isLightMode)
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
          for (var i = 0; i < upiMethods.length; i++) ...[
            Row(
              children: [
                Radio(
                  value: i,
                  groupValue: selectedIndex,
                  onChanged: (value) {
                    onSelected(i);
                  },
                  activeColor: isLightMode ? Colors.black : Colors.white,
                ),
                _buildMethodLogo(upiMethods[i]),
                const SizedBox(width: 10.0),
                Text(
                  upiMethods[i],
                  style: TextStyle(
                      color: isLightMode ? Colors.black : Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
          Divider(color: isLightMode ? Colors.black : AppColors.gray),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle,
                    color: isLightMode ? Colors.black : Colors.white),
                iconSize: 30,
              ),
              TextButton.icon(
                onPressed: () {
                  log("Add UPI button pressed");
                },
                label: Text(
                  AppStrings.addNewUpiID,
                  style: TextStyle(
                      color: isLightMode ? Colors.black : Colors.white),
                ),
              ),
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
      return const SizedBox(width: 40, height: 40);
    }
  }
}
