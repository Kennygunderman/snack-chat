import 'package:flutter/material.dart';
import 'package:snack_chat/service/auth/auth_state.dart';
import 'package:snack_chat/ui/auth/auth_dialog.dart';
import 'package:snack_chat/ui/auth/login_view_model.dart';
import 'package:snack_chat/ui/auth/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<LoginViewModel>(context, listen: false);
    vm.resetState();
  }

  void _handleCreateAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage(title: widget.title)),
    );
  }

  Widget _authScreen(BuildContext context, LoginViewModel viewModel) {
    if (viewModel.state.authStatus == AuthStatus.error) {
      Future.delayed(Duration.zero, () async {
        AuthDialog.show(context, viewModel.state.authError);
      });
    }

    return Padding(
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
                onPressed: () => _handleCreateAccount(context),
                child: Text(
                  "Create one here.",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          TextField(
            textInputAction: TextInputAction.next,
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey.shade100),
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
            onChanged: (value) => viewModel.email = value,
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey.shade100),
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
            onChanged: (value) => viewModel.password = value,
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => viewModel.loginUser(),
              child: Text(
                'Log in'.toUpperCase(),
                style: TextStyle(color: Colors.grey.shade100),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) =>
              _authScreen(context, viewModel)),
    );
  }
}
