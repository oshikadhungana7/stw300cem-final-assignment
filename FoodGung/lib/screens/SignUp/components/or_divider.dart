
import 'package:flutter/material.dart';
import 'package:new_login/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Or",style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w600
            ),
            ),
          ),
          buildDivider()
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
          child: Divider(
            color: Color(0xFFD9D9D9),
            height: 1.5,
          ),
        );
  }
}

