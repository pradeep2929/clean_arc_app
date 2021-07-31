import 'dart:async';
import '/app/navigation/routes.dart';
import '/app/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_screen.dart';

class SplashScreen extends BaseStateLessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    moveToNext();
    return Scaffold(
        backgroundColor: AppColors.tabActive,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ));
  }

  void moveToNext() {
    Timer(Duration(seconds: 2), () {
      Get.offNamed(Routes.dashBoard);
    });
  }
}
