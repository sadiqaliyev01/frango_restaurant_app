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
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        focusColor: AppColors.primaryYellow,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryYellow),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(color: Colors.white),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
