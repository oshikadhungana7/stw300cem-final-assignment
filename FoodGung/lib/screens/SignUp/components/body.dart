import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:new_login/components/already_have_account.dart';
import 'package:new_login/components/reusable_button.dart';
import 'package:new_login/components/rounded_input_field.dart';
import 'package:new_login/components/rounded_name_field.dart';
import 'package:new_login/components/rounded_password_field.dart';
import 'package:new_login/constants.dart';
import 'package:new_login/models/user.dart';
import 'package:new_login/repository/user_repository.dart';
import 'package:new_login/screens/Login/login_screen.dart';
import 'package:new_login/screens/SignUp/components/or_divider.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../SignUp/components/background.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      Navigator.pushNamed(context, '/login');
    } else {
      print("Not Validate");
    }
  }

  _registerUser(User user) async {
    bool isRegister = await UserRepository().register(user);
    if (isRegister) {
      //  MotionToast.success(description: const Text("User Added Successfully")).show(context);
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              channelKey: 'basic_channel',
              title: 'Getstarted',
              body: "Register Successful",
              id: 1));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    } else {
      MotionToast.error(description: const Text("Something went wrong"))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var Password = RoundedPasswordField.getPassword;
    var Email = RoundedInputField.getEmail;
    var Name = RoundedNameField.getName;

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Image.asset(
              "assets/images/register1..webp",
              width: size.width * 0.8,
              height: size.height * 0.35,
            ),

            const SizedBox(
              height: 20,
            ),

            RoundedNameField(
              key: const ValueKey('txtName'),
              hintText: "FullName",
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),

            RoundedInputField(
              key: const ValueKey('txtEmail'),
              hintText: "Email",
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),

            RoundedPasswordField(
              key: const ValueKey('txtPassword'),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
                key: const ValueKey('btnSignup'),
                text: "SIGNUP",
                press: () {
                  User user = User(
                      name: Name.text,
                      email: Email.text,
                      password: Password.text);
                  _registerUser(user);
                  validate();
                },
                textcolor: kPrimaryColor),
            const SizedBox(
              height: 20,
            ),
            AlreadyHaveAccount(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              login: false,
            ),
            const OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SocialMeadiaIcon(icnSrc: "assets/icons/",
            //      press: () {},),
            //     SocialMeadiaIcon(icnSrc: "assets/icons/",
            //      press: () {},),
            //     SocialMeadiaIcon(icnSrc: "assets/icons/",
            //      press: () {},)
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
