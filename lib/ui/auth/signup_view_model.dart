import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/service/auth/auth_service.dart';
import 'package:snack_chat/service/auth/auth_state.dart';

class SignUpViewModel extends ChangeNotifier {
  AuthService _authService;

  SignUpViewModel({AuthService authService}) : _authService = authService;

  String _email = "";
  String _password = "";
  bool _passwordsMatch = false;
  AuthState _state;

  AuthState get state {
    return _state;
  }

  void resetState() {
    _state = AuthState(AuthStatus.UNAUTHED, null);
  }

  String validateEmail(String email) {
    if (EmailValidator.validate(email)) {
      _email = email;
      return null;
    }

    _email = "";
    return "Please enter a valid email.";
  }

  String validatePassword(String password) {
    if (password.length > 5) {
      this._password = password;
      return null;
    }

    return "Password must be at least 6 characters long.";
  }

  String validatePasswordMatch(String confirmedPassword) {
    if (this._password == confirmedPassword) {
      _passwordsMatch = true;
      return null;
    }
    _passwordsMatch = false;
    return "Passwords must match.";
  }

  void registerUser() async {
    if (_email.isEmpty) {
      this._state = AuthState(AuthStatus.ERROR, "Please enter a valid email.");
      notifyListeners();
      return;
    }

    if (!_passwordsMatch) {
      this._state = AuthState(AuthStatus.ERROR, "Passwords need to match.");
      notifyListeners();
      return;
    }

    this._state = AuthState(AuthStatus.LOADING, null);
    notifyListeners();

    this._state = await _authService.signUp(email: _email, password: _password);

    if (this._state.authStatus == AuthStatus.AUTHED) {
      _email = "";
      _password = "";
      _passwordsMatch = false;
    }

    notifyListeners();
  }
}
