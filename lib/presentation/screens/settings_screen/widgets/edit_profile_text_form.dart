import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class EditProfileTextForm extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const EditProfileTextForm({
    super.key,
    required this.labelText,
    this.initialValue,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        focusColor: AppColors.primaryYellow,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryYellow),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),
        hintStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.grey,
        ),
        border: const OutlineInputBorder(),
      ),
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
