import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final String title;

  SignUpPage({Key key, this.title}) : super(key: key);

  void _handleSignUp() {
    //Handle login
  }

  void _handleGoogleSignUp() {
    //Handle login
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
              'Sign Up',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 16),
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
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey.shade100),
                border: OutlineInputBorder(),
                labelText: 'Confirm password',
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleSignUp,
                child: Text(
                  'Sign up'.toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleGoogleSignUp,
                child: Text(
                  'Sign up with Google'.toUpperCase(),
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
