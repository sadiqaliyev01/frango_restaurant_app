import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/register/register_cubit.dart';
import 'package:frango_restaurant_app/cubits/verify_email/verify_email_state.dart';
import 'package:frango_restaurant_app/data/remote/contractor/register_contractor.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this._registerContractor) : super(VerifyEmailInitial());

  final TextEditingController otpController = TextEditingController();
  final RegisterContractor _registerContractor;

  void register(BuildContext context) async {
    try {
      emit(VerifyEmailLoading());
      final registerCubit = context.read<RegisterCubit>();
      final isSuccess = await _registerContractor.register(
        otpCode: otpController.text,
        email: registerCubit.emailController.text,
        name: registerCubit.nameController.text,
        surname: registerCubit.surnameController.text,
        phone: registerCubit.phoneNumberController.text,
        password: registerCubit.passwordController.text,
        birthDate: registerCubit.birthdayController.text,
      );
      if (isSuccess) {
        emit(VerifyEmailSuccess());
        return;
      }
      emit(VerifyEmailFailure());
    } catch (e) {
      emit(VerifyEmailFailure());
    }
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
