import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_login/screens/Cart/cart_screen.dart';
import 'package:new_login/screens/Cart/product_list.dart';
import 'package:new_login/screens/HomePage/homepage.dart';
import 'package:new_login/screens/Map/map.dart';

import '../screens/UserProfile/user_profile.dart';


class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _activePage = 0;
  final _tabItems = [HomePage(), CartScreen(), UserProfile(), MapScreen()];
  @override
  Widget build(BuildContext context) {
   
  
    return Scaffold(
       bottomNavigationBar: CurvedNavigationBar(
        index: 0,   
        backgroundColor: Colors.transparent,
        onTap: (index){
          setState(() {
          _activePage = index;
          print(_activePage);
   });
        },
        height: 70,
        color: Color(0xFF4C53a5),
        items: [
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.shopping_cart_checkout_sharp, size: 30,color: Colors.white,),
          Icon(Icons.person, size: 30,color: Colors.white,),
        ],
        
        ),
        body: _tabItems[_activePage],
    );
  }
}