import 'package:frango_restaurant_app/data/models/remote/login_response.dart';

import '../contractor/login_contractor.dart';
import '../services/remote/login_service.dart';
import '../services/login_service.dart';

class LoginRepository implements LoginContractor {
  const LoginRepository(this._loginService);

  final LoginService _loginService;

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) =>
      _loginService.login(
        email: email,
        password: password,
      );
}
