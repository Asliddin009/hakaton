import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStorage {
  static const authTokenKey = 'KEY_AUTH_TOKEN';


  static Future<String> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(authTokenKey) ?? '';
    return "token $token";
  }

  static Future<void> setAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(authTokenKey, token);
  }
}