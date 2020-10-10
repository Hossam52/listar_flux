import 'package:flutter/material.dart';
import 'package:listar_flux/screens/ForgetPassword.dart';
import 'package:listar_flux/screens/SignUp.dart';

import 'entry_screen.dart';
import 'screens/account.dart';
import 'screens/account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ListarFlux(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        Account.routeName: (context) => Account(),
        SignUp.routeName: (context) => SignUp(),
      },
    );
  }
}
