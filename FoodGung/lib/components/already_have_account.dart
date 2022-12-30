import 'package:flutter/material.dart';
import 'package:new_login/constants.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final bool login;
  final Function() press;
  const AlreadyHaveAccount({
    Key? key,
     this.login=true, 
     required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
         Text(login?"Doesn't have an account?":"Already have an account?", 
              style: TextStyle(color: kPrimaryColor
         ),
         ),
         GestureDetector( onTap: press,
         child: Text(login?"SignUp":"SignIN",
                style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,
         decoration: TextDecoration.underline),
         ),
         ),
      ],
    );
  }
}

