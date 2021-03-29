import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snack_chat/service/auth/auth_service.dart';
import 'package:snack_chat/service/auth/auth_state.dart';

class LoginViewModel extends ChangeNotifier {
  AuthService _authService;

  LoginViewModel({AuthService authService}) : _authService = authService;

  String _email = "";
  String _password = "";
  AuthState _state;

  AuthState get state {
    return _state;
  }

  set email(String email) {
    this._email = email;
  }

  set password(String password) {
    this._password = password;
  }

  void resetState() {
    _state = AuthState(AuthStatus.unuathed, null);
  }

  void loginUser() async {
    this._state = await _authService.logIn(email: _email, password: _password);

    if (this._state.authStatus == AuthStatus.authed) {
      _email = "";
      _password = "";
    }

    notifyListeners();
  }
}
