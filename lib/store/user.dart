import 'package:flutter/material.dart';

class UserStore with ChangeNotifier {
  bool _isLoggedIn = false;
  String _email = '';
  String _name = '';
  String _password = '';
  String _mobile = '';

  bool get isLoggedIn => _isLoggedIn;
  String get email => _email;
  String get password => _password;
  String get name => _name;
  String get mobile => _mobile;

  void register(String name, String email, String mobile, String password) {
    _isLoggedIn = true;
    _email = email;
    _password = password;
    _name = name;
    _mobile = mobile;
    notifyListeners();
  }

  bool login(String enteredEmail, String enteredPassword) {
    // for (var user in _users) {
    if (email == enteredEmail && password == enteredPassword) {
      _isLoggedIn = true;
      notifyListeners();
      return true;
      // }
    }
    // If no user matches the provided credentials, return false
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
