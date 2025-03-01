import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/remote/login_response.dart';

class LoginLocalService {
  LoginLocalService(this._box);

  final Box<String> _box;

  Future<void> saveLoginResponse(LoginResponse response) async {
    _box.put('login', jsonEncode(response.toJson()));
  }

  LoginResponse? get loginResponse {
    try {
      String? loginResponse = _box.get('login');
      if (loginResponse == null) return null;
      LoginResponse decodedResponse =
          LoginResponse.fromJson(jsonDecode(loginResponse));
      return decodedResponse;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteSaveByKey(String key) async {

    await _box.delete(key);
    
  }

  Future<int> clearCache() => _box.clear();

  String? get token => loginResponse?.token;

  bool isTokenValid() {
    // Implement your logic to check if the token is valid
    // For example, check if the token is expired
    return token != null && !isTokenExpired(token!);
  }

  bool isTokenExpired(String token) {
    // Implement your logic to check if the token is expired
    // This could involve decoding the token and checking the expiration date
    // For example, if using JWT, decode and check the expiration claim
    // This is a placeholder implementation
    return false; // Replace with actual expiration check
  }
}
