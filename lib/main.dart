import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/auth/auth_repository.dart';
import 'package:login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: RepositoryProvider(
        create:(context)=>AuthRepository(),
        child: LoginView(),
      )
    );
  }
}


