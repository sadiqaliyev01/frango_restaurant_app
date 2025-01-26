import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/register/register_cubit.dart';

import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_field.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_register_button.dart';
import 'package:frango_restaurant_app/presentation/screens/sign_up_screen/widgets/have_an_account.dart';

import '../../../utils/helpers/pager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();

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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomLoginRegisterField(
                                  controller: registerCubit.nameController,
                                  hintText: "Name",
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller: registerCubit.surnameController,
                                  hintText: "Surname",
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller:
                                      registerCubit.phoneNumberController,
                                  hintText: "Phone Number",
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    if (!value.startsWith('+994')) {
                                      String numbers = value.replaceAll(
                                          RegExp(r'[^0-9]'), '');
                                      registerCubit.phoneNumberController.text =
                                          '+994$numbers';
                                      registerCubit
                                              .phoneNumberController.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(
                                          offset: registerCubit
                                              .phoneNumberController
                                              .text
                                              .length,
                                        ),
                                      );
                                    }
                                    if (value.length > 13) {
                                      // +994 + 9 digits
                                      String formatted = value.substring(0, 13);
                                      registerCubit.phoneNumberController.text =
                                          formatted;
                                      registerCubit
                                              .phoneNumberController.selection =
                                          TextSelection.fromPosition(
                                        TextPosition(offset: formatted.length),
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller: registerCubit.birthdayController,
                                  hintText: "Birth Date",
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller: registerCubit.emailController,
                                  hintText: "Email",
                                ),
                                const SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  controller: registerCubit.passwordController,
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
                                child:
                                    BlocConsumer<RegisterCubit, RegisterState>(
                                  listener: (_, state) {
                                    if (state is RegisterSuccess) {
                                      log("Register success in bloc consumer");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (_) => Pager.otp(context),
                                        ),
                                      );
                                    } else if (state is RegisterFailure) {
                                      registerCubit.showToast(
                                        context,
                                        const Text("Registration failed"),
                                        SnackBarAction(
                                          label: "OK",
                                          onPressed: () {},
                                        ),
                                      );
                                    }
                                  },
                                  builder: (_, state) {
                                    return CustomLoginRegisterButton(
                                      onPressed: state is RegisterLoading
                                          ? () {}
                                          : () => registerCubit
                                              .verifyEmail(context),
                                      child: state is RegisterLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child:
                                                  CircularProgressIndicator(),
                                            )
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
