import 'package:flutter/material.dart';
import 'package:new_login/screens/SignUp/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/register';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Body(child: Column(),)),);
  }
}

