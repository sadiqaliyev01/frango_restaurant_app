import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/remote/contractor/register_contractor.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerContractor) : super(RegisterInitial());

  final RegisterContractor _registerContractor;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  void register() async {
    try {
      emit(RegisterLoading());
      final result = await _registerContractor.register(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
      );

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
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
