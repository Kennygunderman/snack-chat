import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_chat/service/auth/auth_state.dart';
import 'package:snack_chat/ui/auth/auth_dialog.dart';
import 'package:snack_chat/ui/auth/signup_view_model.dart';

class SignUpPage extends StatefulWidget {
  final String title;

  SignUpPage({Key key, this.title}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<SignUpViewModel>(context, listen: false);
    vm.resetState();
  }

  void _pop() {
    Navigator.pop(context);
  }

  Widget _authScreen(BuildContext context, SignUpViewModel viewModel) {
    final loadingIndicator = Center(child: CircularProgressIndicator());
    if (viewModel.state.authStatus == AuthStatus.loading) {
      return loadingIndicator;
    }

    if (viewModel.state.authStatus == AuthStatus.authed) {
      _pop();
      return loadingIndicator;
    }

    if (viewModel.state.authStatus == AuthStatus.error) {
      Future.delayed(Duration.zero, () async {
        AuthDialog.show(context, viewModel.state.authError);
      });
    }

    final screen = Padding(
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
          TextFormField(
            controller: TextEditingController()..text = viewModel.email,
            obscureText: false,
            onChanged: (value) {
              viewModel.validateEmail(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return viewModel.validateEmail(value);
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey.shade100),
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: TextEditingController()..text = viewModel.password,
            obscureText: true,
            validator: (value) {
              return viewModel.validatePassword(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey.shade100),
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: TextEditingController()..text = viewModel.confirmedPassword,
            obscureText: true,
            validator: (value) {
              return viewModel.validatePasswordMatch(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey.shade100),
                border: OutlineInputBorder(),
                labelText: 'Confirm password'),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => viewModel.registerUser(),
              child: Text(
                'Sign up'.toUpperCase(),
                style: TextStyle(color: Colors.grey.shade100),
              ),
            ),
          )
        ],
      ),
    );

    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          title: Text(widget.title),
        ),
        body: Consumer<SignUpViewModel>(
            builder: (context, viewModel, child) =>
                _authScreen(context, viewModel)));
  }
}
