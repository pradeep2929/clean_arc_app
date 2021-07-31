import 'dart:async';

import 'package:alchemy/app/controller/home_controller.dart';
import 'package:alchemy/app/resource/app_colors.dart';
import 'package:alchemy/app/screens/home/home_screen.dart';
import 'package:alchemy/app/screens/profile_screen.dart';
import 'package:alchemy/app/screens/settings_screen.dart';
import 'package:alchemy/app/screens/ticket_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashBoardScreen> with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  late List<Widget> widgetList;

  final iconList = <IconData>[
    Icons.home_filled,
    Icons.airplane_ticket_outlined,
    Icons.person_outline,
    Icons.settings,
  ];
  @override
  void initState() {
    super.initState();
    widgetList = [HomeScreen(), TicketScreen(), ProfileScreen(), SettingsScreen()];
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        extendBody: true,
        body: widgetList[_bottomNavIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? AppColors.tabActive : AppColors.tabInActive;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Icon(
                    iconList[index],
                    size: 24,
                    color: color,
                  ),
                )
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: _bottomNavIndex,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.none,
          leftCornerRadius: 32,
          height: 72,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }
}