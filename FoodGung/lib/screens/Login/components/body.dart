import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:new_login/components/already_have_account.dart';
import 'package:new_login/components/reusable_button.dart';
import 'package:new_login/components/rounded_input_field.dart';
import 'package:new_login/repository/user_repository.dart';
import 'package:new_login/responsive/home_layout.dart';
import 'package:new_login/screens/Login/components/background.dart';
import 'package:new_login/screens/SignUp/sign_up_screen.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/rounded_password_field.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({Key? key, required this.child}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              channelKey: 'basic_channel',
              title: 'Getstarted',
              body: "Welcome to FoodGung",
              id: 1));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeLayout();
      }));
    } else {
      MotionToast.error(
              description: const Text("Either email or password is incorrect"))
          .show(context);
    }
  }

  _loginUser() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
        emailController.text,
        passwordController.text,
      );

      if (isLogin) {
        _navigateToScreen(true);
        // AuthController.login();
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context);
    }
  }

  @override
  void shake() {
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Shake!')));
        // Do stuff on phone shake
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    detector.startListening();
    detector.stopListening();
  }

  @override
  void initState() {
    super.initState();

    shake();

    autoLogin();
  }

  void autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    if (token != null && token.isNotEmpty) {
      _navigateToScreen(true);
    }
  }

  @override
  var emailController = RoundedInputField.getEmail;
  var passwordController = RoundedPasswordField.getPassword;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 204, 40, 40)),
              ),
              Image.asset(
                "assets/images/login.jpg",
                height: size.height * 0.45,
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
                  key: const ValueKey('btnSignIn'),
                  text: "LOGIN",
                  press: () {
                    _loginUser();
                  },
                  textcolor: Colors.white),
              const SizedBox(
                height: 10,
              ),
              AlreadyHaveAccount(
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
