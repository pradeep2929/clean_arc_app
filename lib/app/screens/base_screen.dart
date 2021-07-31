import 'package:alchemy/app/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {

  BaseStatefulState({Key? key}) {
    // Parent constructor
  }

  loadProgress(){
    Get.dialog(Center(child:CircularProgressIndicator(color: AppColors.tabActive)), barrierDismissible: false);
  }
  hideProgress(){
    Get.back();// dismiss dialog
  }
}

abstract class BaseStateLessWidget extends StatelessWidget{

  const BaseStateLessWidget({Key? key}) : super(key: key);

  loadProgress(){
    Get.dialog(Center(child:CircularProgressIndicator(color: AppColors.tabActive)), barrierDismissible: false);
  }
  hideProgress(){
    Get.back();// dismiss dialog
  }
}
