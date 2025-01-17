import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote/services/remote/verify_email_service.dart';
import '../../utils/helpers/pager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void verifyEmail(BuildContext context) async {
    try {
      emit(RegisterLoading());
      log("Register Loading");
      bool isSuccess =
          await VerifyEmailService.verifyEmail(emailController.text);
      if (isSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => Pager.otp(context),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error occured'),
          ),
        );
      }
      emit(RegisterSuccess());
    } on DioException catch (e) {
      log("Dio Exception Error on Register Cubit: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network Error occured'),
        ),
      );
      emit(RegisterFailure());
    } catch (e) {
      log("Error on Register Cubit: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occured'),
        ),
      );
      emit(RegisterFailure());
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
