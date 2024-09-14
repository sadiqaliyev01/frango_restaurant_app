import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frango_restaurant_app/presentation/screens/otp_screen/widgets/opt_sign_button.dart';
import 'package:frango_restaurant_app/utils/constants/app_colors.dart';
import 'package:frango_restaurant_app/utils/constants/app_strings.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final StreamController<bool> _buttonVisibilityController =
      StreamController<bool>();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent)),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                AppStrings.verifyOTPText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.otpSentText,
                  style: TextStyle(color: Colors.white),
                ),
                Text(AppStrings.displayPhoneNumber,
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.lightGray))),
              onChanged: (pin) {
                if (pin.length == 4) {
                  _buttonVisibilityController.sink.add(true);
                } else {
                  _buttonVisibilityController.sink.add(false);
                }
              },
              onCompleted: (pin) => log("OTP completed: $pin"),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                log("Resend OTP button pressed");
              },
              child: const Text(
                AppStrings.resendOTP,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Spacer(),
            StreamBuilder<bool>(
              stream: _buttonVisibilityController.stream,
              initialData: false,
              builder: (context, snapshot) {
                return Visibility(
                  visible: snapshot.data ?? false,
                  child: OtpSignButton(
                    onPressed: () {
                      log("Sign in button pressed");
                    },
                    text: "SIGN IN",
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
