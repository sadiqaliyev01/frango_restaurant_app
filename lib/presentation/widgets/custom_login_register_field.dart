import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomLoginRegisterField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueNotifier<bool> _obscureTextNotifier;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  CustomLoginRegisterField({
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    super.key,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.onChanged,
    this.inputFormatters,
  }) : _obscureTextNotifier = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, isObscure, child) {
        return TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
            ),
            filled: true,
            fillColor: AppColors.buttonAndTextFieldGray,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
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
          onChanged: onChanged,
        );
      },
    );
  }
}
