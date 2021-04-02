import 'package:firebase_auth/firebase_auth.dart';
import 'package:snack_chat/data/model/user.dart' as UserModel;
import 'package:snack_chat/data/repo/user_repo.dart';
import 'package:snack_chat/service/auth/auth_state.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final UserRepo _userRepo;

  AuthService(this._firebaseAuth, this._userRepo);

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

      await _userRepo.saveUser(
        UserModel.User(
          id: null,
          email: email,
          username: _createUsername(email),
        ),
      );
      return AuthState(AuthStatus.authed, null);
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message);
    }
  }

  //Username should be 7 characters or less
  String _createUsername(String email) {
    var username = email.split('@')[0];
    if (username.length <= 7) return username;
    return username.substring(0, 7);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
