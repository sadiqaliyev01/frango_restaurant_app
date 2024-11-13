import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:frango_restaurant_app/data/contractor/login_contractor.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginContractor) : super(LoginInitial());

  final LoginContractor _loginContractor;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    try {
      emit(LoginLoading());
      final result = await _loginContractor.login(
        email: emailController.text,
        password: passwordController.text,
      );

      if (result) {
        emit(LoginSuccess());
        return;
      }
    } catch (e) {
      emit(LoginFailure());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
