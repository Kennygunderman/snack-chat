import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snack_chat/service/auth/auth_state.dart';
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
    vm.state = AuthState(AuthStatus.UNAUTHED, null);
  }

  void _pop() {
    Navigator.pop(context);
  }

  void _showAlertDialog(BuildContext context, String authError) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Authentication Error"),
      content: Text(authError),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _authScreen(BuildContext context, SignUpViewModel viewModel) {
    final loadingIndicator = Center(child: CircularProgressIndicator());
    if (viewModel.state.authStatus == AuthStatus.LOADING) {
      return loadingIndicator;
    }

    if (viewModel.state.authStatus == AuthStatus.AUTHED) {
      _pop();
      return loadingIndicator;
    }

    if (viewModel.state.authStatus == AuthStatus.ERROR) {
      Future.delayed(Duration.zero, () async {
        _showAlertDialog(context, viewModel.state.authError);
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
    // final viewModel = Provider.of<SignUpViewModel>(context);
    // log(viewModel.test());

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          title: Text(widget.title),
        ),
        body: Consumer<SignUpViewModel>(
            builder: (context, viewModel, child) =>
                // _showAlertDialog(context);
                _authScreen(context, viewModel)));
  }
}
