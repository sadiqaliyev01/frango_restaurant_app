import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/cubits/verify_email/verify_email_state.dart';

import '../../data/remote/services/remote/register_service.dart';
import '../../utils/helpers/pager.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitial());
  final TextEditingController otpController = TextEditingController();

  void register(BuildContext context) async {
    try {
      final registerCubit = context.read<RegisterCubit>();
      bool isSuccess = await RegisterService.register(
        otpCode: otpController.text,
        email: registerCubit.emailController.text,
        name: registerCubit.nameController.text,
        surname: registerCubit.surnameController.text,
        phone: registerCubit.phoneNumberController.text,
        password: registerCubit.passwordController.text,
        birthDate: registerCubit.birthdayController.text,
      );
      if (isSuccess) {
        emit(VerifyEmailLoading());
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Pager.home(context),
          ),
          (route) => route.isCurrent,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error occured'),
          ),
        );
      }
      emit(VerifyEmailSuccess());
    } on SocketException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Network Error occured'),
        ),
      );
      emit(VerifyEmailFailure());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occured'),
        ),
      );
      emit(VerifyEmailFailure());
    }
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
