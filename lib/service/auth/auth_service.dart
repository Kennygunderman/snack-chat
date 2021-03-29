import 'package:firebase_auth/firebase_auth.dart';
import 'package:snack_chat/service/auth/auth_state.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<AuthState> logIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return AuthState(AuthStatus.authed, null);
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message);
    }
  }

  Future<AuthState> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthState(AuthStatus.authed, null);
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message);
    }
  }

  Future<void> signOut() async {
      await _firebaseAuth.signOut();
  }
}
