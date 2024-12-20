import '../contractor/login_contractor.dart';
import '../services/login_service.dart';

class LoginRepository implements LoginContractor {
  const LoginRepository(this._loginService);

  final LoginService _loginService;

  @override
  Future<bool> login({
    required String email,
    required String password,
  }) =>
      _loginService.login(
        email: email,
        password: password,
      );
}
