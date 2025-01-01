import 'package:flutter/material.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/custom_login_register_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomLoginRegisterField(
            hintText: AppStrings.fullName,
          ),
          const SizedBox(height: 20),
          CustomLoginRegisterField(
            hintText: AppStrings.registerEmail,
          ),
          const SizedBox(height: 20),
          CustomLoginRegisterField(
            hintText: AppStrings.phoneNumber,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          CustomLoginRegisterField(
            hintText: AppStrings.passwordHintText,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
