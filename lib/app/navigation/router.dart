import 'package:alchemy/app/binding/bashboard_bindings.dart';
import 'package:alchemy/app/screens/bashboard_screen.dart';
import 'package:alchemy/app/screens/home/event_detail_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '/app/screens/splash_screen.dart';
import 'package:get/get.dart';

import 'routes.dart';

class DLTRouter {
  static List<GetPage>? generatePage() {
    return [
      GetPage(name: Routes.splash, page: () => SplashScreen()),
      GetPage(
          name: Routes.dashBoard,
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 200),
          page: () => DashBoardScreen()),
      GetPage(
          name: Routes.eventDetail,
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 200),
          page: () => EventDetailScreen()),
    ];
  }
}
