import 'package:dio/dio.dart';
import 'package:frango_restaurant_app/utils/constants/endpoints.dart';
import 'package:frango_restaurant_app/utils/constants/extensions/status_code.dart';

class AuthService {
  final dio = Dio();

  Future<bool> login({required String email, required String password}) async {
    const endpoint = Endpoints.login;
    final requestBody = {'email': email, 'password': password};

    final response = await dio.post(endpoint, data: requestBody);
    if (response.statusCode.isSuccess) {
      return true;
    } else {
      throw Exception("throw Exception");
    }
  }

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await dio.post(Endpoints.register, //ENDPONT URL
          data: userData, //REQUEST BODY
          queryParameters: {'apikey': 'YOUR_API_KEY'}, //QUERY PARAMETERS
          options: Options(headers: {
            'X-LoginRadius-Sott': 'YOUR_SOTT_KEY', //HEADERS
          }));
      //returns the successful json object
      return response.data;
    } on DioException catch (e) {
      //returns the error object if there is
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData(String accesstoken) async {
    try {
      Response response = await dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {'apikey': 'YOUR_API_KEY'},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${YOUR_ACCESS_TOKEN}',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> logout(String accessToken) async {
    try {
      Response response = await dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        queryParameters: {'apikey': ApiSecret.apiKey},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
