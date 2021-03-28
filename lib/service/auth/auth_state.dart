enum AuthStatus {
  LOADING,
  ERROR,
  AUTHED,
  UNAUTHED
}

class AuthState {
  final AuthStatus authStatus;
  final String authError;
  AuthState(this.authStatus, this.authError);
}