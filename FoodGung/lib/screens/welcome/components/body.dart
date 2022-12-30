import 'package:flutter/material.dart';
import 'package:new_login/constants.dart';
import 'package:new_login/screens/Login/login_screen.dart';
import 'package:new_login/screens/SignUp/sign_up_screen.dart';
import 'package:new_login/screens/welcome/components/background.dart';

import '../../../components/reusable_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundWelcome(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to FoodGung",
              style: TextStyle(
                  color: Color.fromARGB(255, 52, 104, 181),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Image.asset(
              "assets/images/food-banner.png",
              height: size.height * 0.5,
              width: double.infinity,
            ),
            RoundedButton(
              textcolor: Colors.white,
              text: "LOGIN",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              text: "SignUp",
              color: kPrimaryLightColor,
              textcolor: Colors.black,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
