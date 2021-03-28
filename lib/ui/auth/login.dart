import 'package:flutter/material.dart';
import 'package:snack_chat/ui/auth/signup.dart';

class LoginPage extends StatelessWidget {
  final String title;
  LoginPage({Key key, this.title}) : super(key: key);

  void _handleLogin() {
    //Handle login
  }

  void _handleGoogleLogin() {
    //Handle login
  }

  void _handleCreateAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage(title: title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Log In',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Don\'t have an account? ",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey.shade100),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 0, horizontal: 2)),
                  ),
                  onPressed: () { _handleCreateAccount(context); },
                  child: Text(
                    "Create one here.",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey.shade100),
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey.shade100),
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: Text(
                  'Log in'.toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleGoogleLogin,
                child: Text(
                  'Log in with Google'.toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
