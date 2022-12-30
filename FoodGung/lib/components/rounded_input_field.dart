import 'package:flutter/material.dart';
import 'package:new_login/components/text_field_container.dart';
import 'package:new_login/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  // static final getEmail= TextEditingController();
  static final getEmail = TextEditingController();
  

  const RoundedInputField({
    Key? key, 
    required this.hintText, 
    this.icon = Icons.person, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextField(
        onChanged:onChanged,
        controller: getEmail,
      
        decoration: InputDecoration(
          icon:Icon(icon,color: kPrimaryColor,),
          hintText: hintText,
          border: InputBorder.none
        ),
      ),
    );
  }
}
