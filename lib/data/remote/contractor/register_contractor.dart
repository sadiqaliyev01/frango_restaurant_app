import 'package:frango_restaurant_app/data/models/remote/register_response.dart';

abstract class RegisterContractor {
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String username,
  });
}
