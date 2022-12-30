import 'package:flutter/material.dart';
import './responsive_layout.dart';
import '../screens/WearOs/wear_home.dart';
import '../screens/HomePage/homepage.dart';
import '../widgets/HomeBottomNav.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String id = 'HomeLayout';

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        watchBody: WearHomePage(), mobileBody: HomeBottomNavBar());
  }
}
