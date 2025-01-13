import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';

import '../../../../utils/network/dio/dio_client.dart';
import '../../../models/remote/verify_email_response.dart';

class VerifyEmailService {
  final endpoint = Endpoints.verifyEmail;

  Future<VerifyEmailResponse> verifyEmail({required String email}) async {
    final requestBody = {
      'email': email,
    };
    final response = await authDio.post(endpoint, data: requestBody);
    if (response.statusCode.isSuccess) {
      return VerifyEmailResponse.fromJson(response.data);
    } else {
      throw Exception("Registration failed");
    }
  }
}
