import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/service/auth/auth_service.dart';
import 'package:snack_chat/service/auth/auth_state.dart';

class SignUpViewModel extends ChangeNotifier {
  AuthService _authService;

  SignUpViewModel({AuthService authService}) : _authService = authService;

  String _email = "";
  String _password = "";
  String _confirmedPassword = "";
  AuthState _state;

  AuthState get state {
    return _state;
  }

  void resetState() {
    _state = AuthState(AuthStatus.unuathed, null);
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  String get confirmedPassword {
    return _confirmedPassword;
  }

  String validateEmail(String email) {
    _email = email;
    if (EmailValidator.validate(email)) {
      return null;
    }

    return "Please enter a valid email.";
  }

  String validatePassword(String password) {
    this._password = password;
    if (password.length > 5) {
      return null;
    }
    return "Password must be at least 6 characters long.";
  }

  String validatePasswordMatch(String confirmedPassword) {
    _confirmedPassword = confirmedPassword;
    if (this._password == confirmedPassword) {
      return null;
    }
    return "Passwords must match.";
  }

  void registerUser() async {
    if (!EmailValidator.validate(email)) {
      this._state = AuthState(AuthStatus.error, "Please enter a valid email.");
      notifyListeners();
      return;
    }

    if (password != confirmedPassword) {
      this._state = AuthState(AuthStatus.error, "Passwords need to match.");
      notifyListeners();
      return;
    }

    this._state = AuthState(AuthStatus.loading, null);
    notifyListeners();

    this._state = await _authService.signUp(email: _email, password: _password);

    if (this._state.authStatus == AuthStatus.authed) {
      _email = "";
      _password = "";
      _confirmedPassword = "";
    }

    notifyListeners();
  }
}
