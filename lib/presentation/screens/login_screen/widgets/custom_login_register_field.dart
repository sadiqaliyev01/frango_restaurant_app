import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomLoginRegisterField extends StatefulWidget {
  final String hintText;
  final bool obscureText;

  const CustomLoginRegisterField({
    required this.hintText,
    this.obscureText = false,
    super.key,
  });

  @override
  _CustomLoginRegisterFieldState createState() =>
      _CustomLoginRegisterFieldState();
}

class _CustomLoginRegisterFieldState extends State<CustomLoginRegisterField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.buttonAndTextFieldGray,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      style: const TextStyle(color: AppColors.white),
      obscureText: _obscureText,
    );
  }
}
