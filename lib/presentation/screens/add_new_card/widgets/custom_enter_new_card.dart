import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLength;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextEditingController controller;
  final bool isExpiryDate;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.maxLength,
    required this.keyboardType,
    required this.validator,
    this.obscureText = false,
    required this.controller,
    this.isExpiryDate = false,
  });

  void formatExpiryDate(String value) {
    if (value.length == 2 && !value.contains('/')) {
      controller.text = '$value/';
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(color: AppColors.lightGray),
        focusColor: AppColors.primaryYellow,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryYellow, width: 2.0),
        ),
      ),
      maxLength: maxLength,
      style: const TextStyle(color: AppColors.primaryYellow),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: (value) {
        if (isExpiryDate) {
          formatExpiryDate(value);
        }
      },
    );
  }
}
