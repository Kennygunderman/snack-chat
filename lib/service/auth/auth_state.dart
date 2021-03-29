enum AuthStatus {
  loading,
  error,
  authed,
  unuathed
}

class AuthState {
  final AuthStatus authStatus;
  final String authError;
  AuthState(this.authStatus, this.authError);
}