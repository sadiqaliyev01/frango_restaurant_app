import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomLoginRegisterField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomLoginRegisterField({
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    super.key,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  _CustomLoginRegisterFieldState createState() =>
      _CustomLoginRegisterFieldState();
}

class _CustomLoginRegisterFieldState extends State<CustomLoginRegisterField> {
  late ValueNotifier<bool> _obscureTextNotifier;

  @override
  void initState() {
    super.initState();
    _obscureTextNotifier = ValueNotifier(widget.obscureText);
  }

  @override
  void dispose() {
    _obscureTextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextNotifier,
      builder: (context, isObscure, child) {
        return TextFormField(
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
            ),
            filled: true,
            fillColor: AppColors.buttonAndTextFieldGray,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.obscureText
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
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
