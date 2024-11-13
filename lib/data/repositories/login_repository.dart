import 'package:frango_restaurant_app/data/contractor/login_contractor.dart';
import 'package:frango_restaurant_app/data/services/login_service.dart';

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
