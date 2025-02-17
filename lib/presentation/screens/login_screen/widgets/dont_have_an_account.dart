import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';

import '../../../widgets/custom_login_redirect.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLoginRedirectText(
      normalText: AppStrings.dontHaveAnAccount,
      highlightedText: AppStrings.signUpText,
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Pager.signUp,
          ),
        );
      },
    );
  }
}
