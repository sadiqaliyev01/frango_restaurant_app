import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/login_screen.dart';
import 'package:frango_restaurant_app/presentation/widgets/custom_login_redirect.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/widgets/custom_login_register_field.dart';
import 'package:frango_restaurant_app/presentation/screens/login_screen/widgets/custom_login_register_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomLoginRegisterField(
                                  hintText: AppStrings.fullName,
                                ),
                                SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  hintText: AppStrings.registerEmail,
                                ),
                                SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  hintText: AppStrings.phoneNumber,
                                  keyboardType: TextInputType.phone,
                                ),
                                SizedBox(height: 20),
                                CustomLoginRegisterField(
                                  hintText: AppStrings.passwordHintText,
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
                                child: CustomLoginRegisterButton(
                                  buttonText: AppStrings.signUpButton,
                                  onPressed: () {},
                                  backgroundColor:
                                      AppColors.buttonAndTextFieldGray,
                                ),
                              ),
                              const SizedBox(height: 5),
                              CustomLoginRegisterButton(
                                buttonText: AppStrings.signUpGoogle,
                                onPressed: () {},
                                backgroundColor: AppColors.primaryBlack,
                                svgIconPath: 'assets/icons/google.svg',
                              ),
                              const SizedBox(height: 25),
                              CustomLoginRedirectText(
                                normalText: AppStrings.haveAnAccount,
                                highlightedText: AppStrings.loginText,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ));
                                },
                              ),
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
