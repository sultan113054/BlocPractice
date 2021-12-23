import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/auth/auth_repository.dart';
import 'package:login/auth/form_submission_status.dart';
import 'package:login/auth/login/login_bloc.dart';
import 'package:login/auth/login/login_event.dart';

import 'auth/login/login_state.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepository: context.read<AuthRepository>()),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _name(),
              _password(),
              _loginButton(),
            ],
          ),
        ));
  }

  Widget _name() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.ac_unit), hintText: 'username'),
        validator: (value) => state.isValidUserName ? null : 'invalid username',
        onChanged: (value) =>
            context.read<LoginBloc>().add(UserNameChanged(username: value)),
      );
    });
  }

  Widget _password() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(
            icon: Icon(Icons.ac_unit), hintText: 'password'),
        validator: (value) =>
            state.isValidUserpassword ? null : 'invalid password',
        onChanged: (value) =>
            context.read<LoginBloc>().add(PasswordChanged(password: value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formSubmissionStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              child: Text('Login'),
            );
    });
  }
}
