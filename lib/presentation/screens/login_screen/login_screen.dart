import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/widgets/dont_have_an_account.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_button.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_field.dart';
import 'package:frango_restaurant_app/utils/helpers/pager.dart';
import 'package:frango_restaurant_app/utils/snackbars/custom_snack_bar.dart';

import '../../../cubits/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
            final screenHeight = constraints.maxHeight;
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight - keyboardHeight,
                ),
                child: IntrinsicHeight(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 3 / 4.5,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    AppStrings.welcomeBack,
                                    style: TextStyle(
                                        color: AppColors.white, fontSize: 26),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  AppStrings.welcomeSubText,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomLoginRegisterField(
                                    controller: loginCubit.emailController,
                                    hintText: AppStrings.emailOrPhoneHintText,
                                  ),
                                  const SizedBox(height: 20),
                                  CustomLoginRegisterField(
                                    controller: loginCubit.passwordController,
                                    hintText: AppStrings.passwordHintText,
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 70),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 60.0),
                                  child: BlocConsumer<LoginCubit, LoginState>(
                                    listener: (_, state) {
                                      if (state is LoginSuccess) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                Pager.home(context),
                                          ),
                                          (route) => false,
                                        );
                                      } else if (state is LoginFailure) {
                                        CustomSnackBar.showError(
                                          context,
                                          message: state.message,
                                        );
                                      }
                                    },
                                    builder: (_, state) =>
                                        CustomLoginRegisterButton(
                                      onPressed: state is LoginLoading
                                          ? null
                                          : loginCubit.login,
                                      child: state is LoginLoading
                                          ? const CircularProgressIndicator()
                                          : const Text(
                                              AppStrings.loginButtonText,
                                              style: TextStyle(
                                                color: AppColors.white,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const DontHaveAnAccount(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
