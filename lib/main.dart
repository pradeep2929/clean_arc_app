import 'package:alchemy/app/resource/app_colors.dart';
import 'package:alchemy/data/repositoryImpl/remote/event_remote_client_impl.dart';
import 'package:alchemy/domain/repository/event_repository.dart';
import 'package:alchemy/domain/use_case/event_use_case.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import 'app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/navigation/router.dart';
import 'app/navigation/routes.dart';
import 'data/repositoryImpl/event_repository_impl.dart';
import 'utils/message.dart';

void main() async {
  await initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _configureStatusBar();
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      fallbackLocale: Locale('en', ''),
      translations: Message(),
      locale: Locale('en', ''),
      getPages: DLTRouter.generatePage(),
    );
  }

}
Future<void> _configureStatusBar() async {
  await FlutterStatusbarcolor.setStatusBarColor(AppColors.tabActive);
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}

Future<void> initialize() async {
  Get.put<EventRemoteClient>(EventRemoteClientImpl());
  Get.put<EventRepository>(EventRepositoryImpl(Get.find()));
  Get.put(EventUseCase(Get.find()));
  Get.put(HomeController(), permanent: true);
}
