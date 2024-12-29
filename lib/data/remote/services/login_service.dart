import 'package:frango_restaurant_app/data/models/remote/login_response.dart';
import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';

import '../../../utils/network/dio/dio_client.dart';
class LoginService {
  Future<LoginResponse> login({required String email,  required String password}) async {
    const endpoint = Endpoints.login;
    final requestBody = {
      'email' : email,
      'password': password
    };
    final response = await authDio.post(endpoint, data: requestBody);
    if (response.statusCode.isSuccess) {
      return LoginResponse.fromJson(response.data);
    } else {
      throw Exception("throw Exception");
    }
  }
}
