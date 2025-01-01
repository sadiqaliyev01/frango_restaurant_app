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
      LoginResponse decodedResponse =
      LoginResponse.fromJson(jsonDecode(loginResponse!));
      return decodedResponse;
    } catch (e) {
      return null;
    }
  }

  Future<int> clearCache() => _box.clear();
}
