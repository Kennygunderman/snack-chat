import 'package:flutter/material.dart';
import 'package:snack_chat/ui/auth/login.dart';
import 'package:snack_chat/ui/auth/signup.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primary = Colors.blue;
    final title = "Chat App";
    return MaterialApp(
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
          "/signup": (_) => new SignUpPage(title: title),
        },
        home: LoginPage(title: 'Snack Chat'));
  }
}