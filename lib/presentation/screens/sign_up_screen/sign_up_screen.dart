import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/home_screen/home_screen.dart';
import 'package:frango_restaurant_app/presentation/screens/sign_up_screen/widgets/have_an_account.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_field.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/register/register_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

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
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 3 / 5,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  AppStrings.createAccountText,
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 26),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                AppStrings.createAccountSubText,
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
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomLoginRegisterField(
                                  controller: cubit.usernameController,
                                  hintText: "Username",
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller: cubit.emailController,
                                  hintText: "Email",
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller: cubit.passwordController,
                                  hintText: "Password",
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: BlocConsumer<RegisterCubit, RegisterState>(
                                  listener: (context, state) {
                                    if (state is RegisterSuccess) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                          const HomeScreen(),
                                        ),
                                            (route) => route.isCurrent,
                                      );
                                    } else if (state is RegisterFailure) {
                                      cubit.showToast(
                                        context,
                                        const Text("Registration failed"),
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
                                        cubit.register();
                                      },
                                      child: (state is RegisterLoading)
                                          ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator())
                                          : const Text(
                                        AppStrings.signUpButton,
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
                              const HaveAnAccount(),
                            ],
                          ),
                        ),
                      ],
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

