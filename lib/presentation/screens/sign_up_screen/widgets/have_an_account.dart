import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/login/login_cubit.dart';
import 'package:frango_restaurant_app/data/remote/contractor/login_contractor.dart';
import 'package:frango_restaurant_app/data/remote/repositories/login_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/login_service.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_redirect.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/utils/di/locator.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLoginRedirectText(
      normalText: AppStrings.haveAnAccount,
      highlightedText: AppStrings.loginText,
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>BlocProvider<LoginCubit>(
              create: (context) => locator(),
                child: const LoginScreen()),
          ),
          (route) => route.isCurrent,
        );
      },
    );
  }
}
