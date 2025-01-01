import 'package:frango_restaurant_app/data/models/remote/login_response.dart';

abstract class LoginContractor {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}
