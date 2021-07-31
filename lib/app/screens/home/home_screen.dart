import 'package:alchemy/app/controller/home_controller.dart';
import 'package:alchemy/app/resource/search_bar.dart';
import 'package:alchemy/app/screens/home/event_widget.dart';
import 'package:alchemy/app/screens/home/recommended_event_widget.dart';

import '/app/controller/base_controller.dart';
import '/app/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulState<HomeScreen> {
  @override
  initState() {
    super.initState();
    Get.find<HomeController>().getEvents();
    Get.find<HomeController>().getEventDetails();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<HomeController>(),
        builder: (HomeController controller) {
          WidgetsBinding.instance?.addPostFrameCallback((_) => handleResponse(controller));
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.tabActive,
              centerTitle: false,
              shadowColor: AppColors.shadowColor,
              actions: [_notificationWidget()],
              bottom: SearchBar(hint: 'search_home'.tr),
              title: Text('Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(45),
                ),
              ),
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: [
                        _recommendedEventsWidget(),
                        _loadRecommendedLEventList(controller),
                        _allEvents(controller)
                      ],
                    )
                  ]),
                )
              ],
            ),
          );
        });
  }

  Widget _allEvents(HomeController controller) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('all_events'.tr,
                  style: TextStyle(fontSize: 13, color: Color(0xFF565066))),
            ),
            controller.eventList.isEmpty
                ? Container()
                : Column(
                    children: controller.eventList
                        .map<EventWidget>((s) => EventWidget(event: s))
                        .toList())
          ],
        ),
      ),
    );
  }

  Widget _loadRecommendedLEventList(HomeController controller) {
    return RecommendedEventWidget(eventList: controller.eventList);
  }

  Widget _recommendedEventsWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('recommended_events'.tr,
              style: TextStyle(fontSize: 13, color: Color(0xFF565066))),
          Text(
            'view_all'.tr,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE77460)),
          )
        ],
      ),
    );
  }

  Widget _notificationWidget() {
    return Container(
      width: 32,
      margin: EdgeInsets.only(right: 26),
      child: InkWell(
          onTap: () {},
          child: Icon(
            Icons.notifications_active_outlined,
            color: Colors.white,
          )),
    );
  }

  handleResponse(controller) {
    switch (controller.status) {
      case Status.SUCCESS:
        hideProgress();
        break;
      case Status.LOADING:
        loadProgress();
        break;
      case Status.ERROR:
        Get.snackbar("Error", controller.error);
        break;
      default:
        break;
    }
  }
}
