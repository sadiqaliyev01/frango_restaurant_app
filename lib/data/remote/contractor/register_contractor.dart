import 'package:frango_restaurant_app/data/models/remote/register_response.dart';

abstract class RegisterContractor {
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String verificationCode,
    required String name,
    required String surname,
    required String phoneNumber,
    required String birthDate,
  });
}
