import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/data/remote/contractor/verify_email_contractor.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._verifyEmailContract) : super(RegisterInitial());

  final VerifyEmailContractor _verifyEmailContract;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController =
      TextEditingController(text: "+994");

  void verifyEmail() async {
    try {
      emit(RegisterLoading());
      log("Register Loading");
      final isSuccess =
          await _verifyEmailContract.verifyEmail(emailController.text);
      if (isSuccess) {
        emit(RegisterSuccess());
        return;
      }
      emit(RegisterFailure());
    } on DioException catch (e) {
      log("Dio Exception Error on Register Cubit: $e");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Network Error occured'),
      //   ),
      // );
      emit(RegisterFailure());
    } catch (e) {
      emit(RegisterFailure());

      // log("Error on Register Cubit: $e");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Error occured'),
      //   ),
      // );
    }
  }

  void showToast(BuildContext context, Widget content, SnackBarAction? action) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: content,
        action: action,
      ),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    nameController.dispose();
    surnameController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    birthdayController.dispose();
    return super.close();
  }
}
