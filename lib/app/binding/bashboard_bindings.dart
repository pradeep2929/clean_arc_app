import 'package:alchemy/app/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class BashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}