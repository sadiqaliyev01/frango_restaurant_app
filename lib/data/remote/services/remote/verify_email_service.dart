import 'dart:developer';

import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';

import '../../../../utils/network/dio/dio_client.dart';

class VerifyEmailService {
  static Future<bool> verifyEmail(String email) async {
    const endpoint = Endpoints.verifyEmail;
    log("Verify email endpoint: $endpoint");
    final requestBody = {
      'email': email,
    };
    log("Verify email request body: $requestBody");
    final response = await authDio.post(
      endpoint,
      data: requestBody,
    );
    log("Verify email response: ${response.data}");
    log("Verify email status code: ${response.statusCode}");
    return response.statusCode.isSuccess;
  }
}
