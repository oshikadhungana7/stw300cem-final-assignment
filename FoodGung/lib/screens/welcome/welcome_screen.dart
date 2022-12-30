import 'package:flutter/material.dart';
import 'package:new_login/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
   static const routeName = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}