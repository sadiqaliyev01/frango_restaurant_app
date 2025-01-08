import 'package:frango_restaurant_app/data/models/remote/register_response.dart';
import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class RegisterService {
  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String verificationCode,
    required String name,
    required String surname,
    required String phoneNumber,
    required String birthDate,
  }) async {
    const endpoint = Endpoints.register;
    final requestBody = {
      'email': email,
      'password': password,
      "verificationCode": verificationCode,
      "name": name,
      "surname": surname,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate,
    };
    final response = await authDio.post(endpoint, data: requestBody);
    if (response.statusCode.isSuccess) {
      return RegisterResponse.fromJson(response.data);
    } else {
      throw Exception("Registration failed");
    }
  }
}
