import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          submitButton()
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'you@example.com',
          labelText: 'Email Address',
          errorText: snapshot.error,
        ),
      );
    },
  );
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        obscureText: true,
        onChanged: bloc.changePassword,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error,
        ),
      );
    },
  );
}

Widget submitButton() {
  return RaisedButton(
    child: Text('Login'),
    color: Colors.blue,
    onPressed: () {},
  );
}
