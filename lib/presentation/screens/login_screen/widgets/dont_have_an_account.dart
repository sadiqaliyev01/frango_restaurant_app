import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/data/remote/repositories/register_repository.dart';
import 'package:frango_restaurant_app/data/remote/services/remote/register_service.dart';
import 'package:frango_restaurant_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';

import '../../../widgets/custom_login_redirect.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLoginRedirectText(
      normalText: AppStrings.dontHaveAnAccount,
      highlightedText: AppStrings.signUpText,
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => RegisterCubit(
                RegisterRepository(
                  RegisterService(),
                ),
              ),
              child: const SignUpScreen(),
            ),
          ),
          (route) => route.isCurrent,
        );
      },
    );
  }
}
