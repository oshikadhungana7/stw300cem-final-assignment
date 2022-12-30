import 'package:flutter/material.dart';
import 'package:new_login/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() ? press;
  final Color textcolor,color;
  const RoundedButton({
    Key? key, 
    required this.text, 
    required this.press, 
    required this.textcolor,
    this.color = kPrimaryColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.8,
      child: ElevatedButton(
        onPressed: press,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),),
    );
  }
}
