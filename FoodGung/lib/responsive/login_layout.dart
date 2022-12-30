import 'package:flutter/material.dart';
import './responsive_layout.dart';
import '../screens/WearOs/wear_login.dart';
import '../screens/Login/login_screen.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);
  static const String id = 'loginLayout';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        watchBody:   WearOsWatch(), mobileBody:  const LoginScreen());
  }
}
