import 'package:flutter/material.dart';
import 'package:new_login/screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(body: SafeArea(child: Body(child: Column(),))
    );
  }
}

