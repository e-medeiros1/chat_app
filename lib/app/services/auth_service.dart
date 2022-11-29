import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future userLogin(String username) async {
    try {
      _prefs.setString('username', username);
    } catch (e) {
      log('Login has failed', error: e);
      throw Exception('Login has failed');
    }
  }

  userLogout() {
    try {
      _prefs.clear();
    } catch (e) {
      log('Logout has failed', error: e);
      throw Exception('Logout has failed');
    }
  }

  String? getUsername() {
    return _prefs.getString('username') ?? 'Default value';
  }

  updateUsername(String updatedUsername) {
    _prefs.setString('username', updatedUsername);
    notifyListeners();
  }
}
