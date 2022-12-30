import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
     var category = args['category'];
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,
            size: 30,
            color: Color(0xFF4C53A5),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "${category}",
               style: TextStyle(fontSize: 23,
                      fontWeight: FontWeight.bold ,
                      color: Color(0xFF4C53A5)
                      ),
                      ),
                      ),
                Spacer(),
           
        ],
      ),
    );
  }
}