// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

// class CustomLoginRegisterField extends StatelessWidget {
//   final String hintText;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final ValueNotifier<bool> _obscureTextNotifier;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final Widget? prefixIcon;
//   final void Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final VoidCallback? onTap;
//   final bool readOnly;

//   CustomLoginRegisterField({
//     required this.hintText,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.text,
//     this.controller,
//     this.validator,
//     this.prefixIcon,
//     this.onChanged,
//     this.inputFormatters,
//     this.onTap,
//     this.readOnly = false,
//     super.key,
//   }) : _obscureTextNotifier = ValueNotifier(obscureText);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: _obscureTextNotifier,
//       builder: (context, isObscure, child) {
//         return TextFormField(
//           inputFormatters: inputFormatters,
//           validator: validator,
//           controller: controller,
//           readOnly: readOnly,
//           onTap: onTap,
//           decoration: InputDecoration(
//             prefixIcon: prefixIcon,
//             prefixIconConstraints: const BoxConstraints(
//               minHeight: 0,
//               minWidth: 0,
//             ),
//             filled: true,
//             fillColor: AppColors.buttonAndTextFieldGray,
//             hintText: hintText,
//             hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(25),
//               borderSide: BorderSide.none,
//             ),
//             suffixIcon: obscureText
//                 ? IconButton(
//                     icon: Icon(
//                       isObscure ? Icons.visibility : Icons.visibility_off,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       _obscureTextNotifier.value = !isObscure;
//                     },
//                   )
//                 : null,
//           ),
//           style: const TextStyle(color: AppColors.white),
//           obscureText: isObscure,
//           keyboardType: keyboardType,
//           onChanged: onChanged,
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';

class CustomLoginRegisterField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueNotifier<bool> _obscureTextNotifier;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool readOnly;

  CustomLoginRegisterField({
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.onChanged,
    this.inputFormatters,
    this.onTap,
    this.readOnly = false,
    super.key,
  }) : _obscureTextNotifier = ValueNotifier(obscureText);

  @override
  State<CustomLoginRegisterField> createState() =>
      _CustomLoginRegisterFieldState();
}

class _CustomLoginRegisterFieldState extends State<CustomLoginRegisterField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget._obscureTextNotifier,
      builder: (context, isObscure, child) {
        return TextFormField(
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          controller: _controller,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
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
                      widget._obscureTextNotifier.value = !isObscure;
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
