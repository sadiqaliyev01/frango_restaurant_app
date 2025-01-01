import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class CustomLoginRegisterButton extends StatelessWidget {
  const CustomLoginRegisterButton({super.key, this.onPressed, required this.child});
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonAndTextFieldGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
