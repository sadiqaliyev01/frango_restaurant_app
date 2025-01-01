import 'package:frango_restaurant_app/data/models/remote/register_response.dart';

import '../contractor/register_contractor.dart';
import '../services/remote/register_service.dart';

class RegisterRepository implements RegisterContractor {
  const RegisterRepository(this._registerService);

  final RegisterService _registerService;

  @override
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String username,
  }) =>
      _registerService.register(
        email: email,
        password: password,
        username: username,
      );
}
