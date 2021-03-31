import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_chat/service/auth/auth_service.dart';
import 'package:snack_chat/ui/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snack_chat/ui/auth/login_view_model.dart';
import 'package:snack_chat/ui/auth/signup_view_model.dart';
import 'package:snack_chat/ui/chatroom/chatroom.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final title = "Chat App";
    final primary = Colors.blue;

    final authService = AuthService(FirebaseAuth.instance);
    authService.signOut();
    return MultiProvider(
      //App level dependencies
      providers: [
        Provider<AuthService>(
            create: (_) => authService
        ),
        ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(authService: authService)
        ),
        ChangeNotifierProvider<SignUpViewModel>(
            create: (_) => SignUpViewModel(authService: authService)
        ),
        StreamProvider(
          create: (context) => authService.authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
          title: title,
          theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: primary,
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )),
          routes: {
            "/login": (_) => new LoginPage(title: title),
          },
          home: AuthWrapper(title: title)),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final String title;
  AuthWrapper({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    //
    // if (firebaseUser != null) {
    //   return ChatPage();
    // }
    //
    // return LoginPage(title: title);
    return ChatRoomPage();
  }
}
