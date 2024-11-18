import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/widgets/dont_have_an_account.dart';
import 'package:frango_restaurant_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_button.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_redirect.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_field.dart';

import '../../../cubits/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

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
                                    controller: cubit.emailController,
                                    hintText: AppStrings.emailOrPhoneHintText,
                                  ),
                                  const SizedBox(height: 20),
                                  CustomLoginRegisterField(
                                    controller: cubit.passwordController,
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
                                    listener: (context, state) {
                                      if (state is LoginSuccess) {
                                        log("Login successful: LoginSuccess");
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                          (route) => route.isCurrent,
                                        );
                                      } else if (state is LoginFailure) {
                                        log("Login failed: LoginFailure");
                                        cubit.showToast(
                                          context,
                                          const Text("Incorrect email or password"),
                                          SnackBarAction(
                                            label: "OK",
                                            onPressed: () {},
                                          ),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      return CustomLoginRegisterButton(
                                        onPressed: () {
                                          cubit.login();
                                        },
                                        child: (state is LoginLoading)
                                            ? const SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator())
                                            : const Text(
                                                "LOGIN",
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                      );
                                    },
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
