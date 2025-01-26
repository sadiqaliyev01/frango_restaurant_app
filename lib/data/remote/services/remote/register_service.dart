import 'dart:developer';

import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';
import 'package:frango_restaurant_app/utils/network/dio/dio_client.dart';

class RegisterService {
  Future<bool> register({
    required String otpCode,
    required String email,
    required String name,
    required String surname,
    required String phone,
    required String password,
    required String birthDate,
  }) async {
    const endpoint = Endpoints.register;
    log("Register endpoint: $endpoint");
    final requestBody = {
      "verificationCode": otpCode,
      "name": name,
      "surname": surname,
      "email": email,
      "phoneNumber": phone,
      "password": password,
      "birthDate": birthDate,
    };
    log("Register request body: $requestBody");
    final response = await authDio.post(
      endpoint,
      data: requestBody,
    );
    log("Register status code: ${response.statusCode}");
    log("Register response body: ${response.data}");
    return response.statusCode.isSuccess;
  }
}
