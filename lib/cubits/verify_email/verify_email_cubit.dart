import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frango_restaurant_app/cubits/verify_email/verify_email_state.dart';
import 'package:frango_restaurant_app/data/remote/contractor/verify_email_contractor.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this._verifyEmailContractor) : super(VerifyEmailInitial());

  final VerifyEmailContractor _verifyEmailContractor;

  final TextEditingController emailController = TextEditingController();

  void verifyEmail() async {
    try {
      emit(VerifyEmailLoading());
      final result = await _verifyEmailContractor.verifyEmail(
        email: emailController.text,
      );
      emit(VerifyEmailSuccess());
    } catch (e) {
      emit(VerifyEmailFailure());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();

    return super.close();
  }
}
