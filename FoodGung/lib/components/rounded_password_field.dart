import 'package:flutter/material.dart';
import 'package:new_login/components/text_field_container.dart';
import 'package:new_login/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  static final getPassword = TextEditingController();
   RoundedPasswordField({
    Key? key, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: getPassword,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock,color: kPrimaryColor,),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.visibility,color: kPrimaryColor,)
        ),
      ),
    );
  }
}

