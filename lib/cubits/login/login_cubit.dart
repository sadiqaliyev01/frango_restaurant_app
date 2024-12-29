import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote/contractor/login_contractor.dart';
import '../../data/remote/services/local/local_login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginContractor, this._loginLocalService)
      : super(LoginInitial());

  final LoginContractor _loginContractor;
  final LoginLocalService _loginLocalService;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      emit(LoginLoading());
      log("Loading");
      final response = await _loginContractor.login(
        email: emailController.text,
        password: passwordController.text,
      );
      log("Success");
      await _loginLocalService.saveLoginResponse(response);

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
      log("Error");
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
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
}
