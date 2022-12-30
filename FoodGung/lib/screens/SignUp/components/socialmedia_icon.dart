import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_login/constants.dart';

class SocialMeadiaIcon extends StatelessWidget {
  final String icnSrc;
  final Function() press;
  const SocialMeadiaIcon({
    Key? key, 
    required this.icnSrc, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: kPrimaryLightColor,
            ),
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset(
            icnSrc,
            // "assets/icons/facebook.svg"),
          )
      ),
    );
  }
}
