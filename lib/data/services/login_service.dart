import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/data/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';

class LoginService {
  Future<bool> login({required String email,  required String password}) async {
    const endpoint = Endpoints.login;
    final dio = Dio();
    final requestBody = {
      'email' : email,
      'password': password
    };

    final response = await dio.post(endpoint, data: requestBody);
    if (response.statusCode.isSuccess) {
      return true;
    } else {
      throw Exception("throw Exception");
    }
  }
}
