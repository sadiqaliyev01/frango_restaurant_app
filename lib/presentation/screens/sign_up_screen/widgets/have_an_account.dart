import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_redirect.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLoginRedirectText(
      normalText: AppStrings.haveAnAccount,
      highlightedText: AppStrings.loginText,
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Pager.login,
          ),
        );
      },
    );
  }
}
