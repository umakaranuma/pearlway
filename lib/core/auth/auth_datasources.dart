import 'dart:convert';

import 'package:pearlway/core/auth/model/login_response.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSources {
  final SharedPreferences prefs = GetIt.instance<SharedPreferences>();

  Future<void> saveToken(String token) async {
    await prefs.setString('authToken', token);
  }

  String? getToken() => prefs.getString('authToken');

  Future<void> saveUser(User user) async {
    String userJson = jsonEncode(user.toJson());
    await prefs.setString('user', userJson);
  }

  User? getUser() {
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<void> clearAll() async {
    await prefs.remove('authToken');
    await prefs.remove('user');
  }
}
