import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomLoginRegisterField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueNotifier<bool> _obscureTextNotifier;
  final TextEditingController? controller;

  CustomLoginRegisterField({
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    super.key,
    this.controller,
  }) : _obscureTextNotifier = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, isObscure, child) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.buttonAndTextFieldGray,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _obscureTextNotifier.value = !isObscure;
                    },
                  )
                : null,
          ),
          style: const TextStyle(color: AppColors.white),
          obscureText: isObscure,
          keyboardType: keyboardType,
        );
      },
    );
  }
}
