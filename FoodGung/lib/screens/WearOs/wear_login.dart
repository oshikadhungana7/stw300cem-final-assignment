import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:new_login/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wear/wear.dart';
import '../../repository/user_repository.dart';
import 'package:new_login/responsive/home_layout.dart';
import 'package:new_login/screens/Login/components/background.dart';

class WearOsWatch extends StatefulWidget {
  const WearOsWatch({Key? key}) : super(key: key);

  @override
  State<WearOsWatch> createState() => _WearOsWatchState();
}

class _WearOsWatchState extends State<WearOsWatch> {
  void autoLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    if (token != null && token.isNotEmpty) {
      _navigateToScreen(true);
    }
  }

  @override
  void initState() {
    super.initState();

    // autoLogin();
  }

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
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
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context);
    }
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(
        builder: (context, mode, child) {
          return Scaffold(
              body: Background(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFFEF8CCC)),
                    ),
                    // Image.asset(
                    //   "assets/images/login.jpg",
                    //   height: MediaQuery.of(context).size.height * 0.25,
                    // ),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.only(left: 4),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          hintStyle: TextStyle(fontSize: 3),
                          labelStyle: TextStyle(fontSize: 3),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 10,
                      padding: const EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: "password",
                          labelText: "PASSWORD",
                          hintStyle: TextStyle(fontSize: 5),
                          labelStyle: TextStyle(fontSize: 6),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      // height: 30,
                      // width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(40, 10), backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(7.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            _loginUser();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.purple, fontSize: 9),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      );
    });
  }
}
