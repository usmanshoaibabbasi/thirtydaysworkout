import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/account_screens/account_screen.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/bmi_screens/bmi_screen.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/diet_screen.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/health_screen.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/home_screens/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final screens = [
    const HomeClass(),
    const BMIClass(),
    const DietClass(),
    const HealthClass(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    if (kDebugMode) {
      // print('build');
    }
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          body: Center(
            child: screens[bottomNavProvider.currentIndex],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            color: navbarcolor,
            backgroundColor: Colors.transparent,
            items: const <Widget>[
              Icon(
                CupertinoIcons.house,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.bolt,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.bag,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.heart_fill,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.person_solid,
                size: 30,
                color: unSelectedIconColor,
              ),
            ],
            height: 60,
            index: bottomNavProvider.currentIndex,
            buttonBackgroundColor: navbarcolor,
            // onTap: (index) => setState(() {
            //   this.index = index;
            // }),
            onTap: (index) {
              bottomNavProvider.setindex(index);
            },
          )),
    );
  }
}