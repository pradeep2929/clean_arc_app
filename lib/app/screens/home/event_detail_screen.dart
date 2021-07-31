import 'package:alchemy/app/controller/home_controller.dart';
import 'package:alchemy/app/resource/app_colors.dart';
import 'package:alchemy/app/resource/heart_buttton.dart';
import 'package:alchemy/app/resource/rounded_button.dart';
import 'package:alchemy/app/screens/base_screen.dart';
import 'package:alchemy/app/screens/home/similar_event_wiget.dart';
import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

import 'event_details_header.dart';

class EventDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliverAppBarSnapState();
}

class _SliverAppBarSnapState extends BaseStatefulState<EventDetailScreen> {
  double get maxHeight => 320 + MediaQuery.of(context).padding.top;

  double get minHeight =>
      kToolbarHeight + MediaQuery.of(context).padding.top + 50;

  @override
  initState() {
    super.initState();
    _configureStatusBar();
  }

  Future<void> _configureStatusBar() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<HomeController>(),
      builder: (HomeController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: _floatingButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                getAppBar(controller),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                )
              ];
            },
            body: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: _buildEventDetail(controller))
              ],
            ),
          ),
        );
      },
    );
  }

  SliverAppBar getAppBar(controller) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: InkWell(
            child: Icon(
              Icons.ios_share,
              color: Colors.white,
            ),
            onTap: () {
              Get.back();
            },
          ),
        )
      ],
      leading: InkWell(
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onTap: () {
          Get.back();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
          stretchModes: <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground
          ],
          background: EventDetailsHeader(
            eventDetail: controller.eventDetailList[0],
            maxHeight: maxHeight,
            minHeight: minHeight,
          )),
      expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
    );
  }

  Widget _floatingButton() {
    return Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        height: 70,
        alignment: Alignment.center,
        color: Colors.white,
        child: RoundedButton(
          title: '{PRICE} - I’M IN!',
          elevation: 8,
          buttonColor: Color(0XFF11D0A2),
          height: 50,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          onPress: () {},
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ));
  }

  Widget _buildEventDetail(HomeController controller) {
    var eventDetail = controller.eventDetailList[0];
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 100, top: 22, left: 22, right: 22),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Text('total_price'.tr,
                  style: TextStyle(
                      color: Color(0xFF475464),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              Text(' \£${eventDetail.totalPrize}',
                  style: TextStyle(
                      color: Color(0xFF475464),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    RoundedButton(
                      title: 'Share Event',
                      width: 120,
                      height: 28,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      borderWidth: 0,
                      borderRadius: BorderRadius.circular(14),
                      buttonColor: Color(0xFF9DA6B1),
                      icon: Icon(
                        Icons.person_add_alt,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 24),
                    HeartButton()
                  ]))
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.airplane_ticket, color: Color(0xfF475464)),
              SizedBox(width: 8),
              Text(
                  '${eventDetail.friendsAttending}/${eventDetail.maxTickets} ' +
                      'attending_total'.tr,
                  style: TextStyle(
                      color: AppColors.tabActive,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 16),
          tagRow(),
          SizedBox(height: 25),
          aboutSection(eventDetail),
          SizedBox(height: 25),
          divider(),
          SizedBox(height: 25),
          venueSection(eventDetail),
          SizedBox(height: 25),
          divider(),
          SizedBox(height: 25),
          eventCreatorWidget(
              'EVENT CREATED BY :', eventDetail.eventCreator, Icons.person_pin,
              fontWeight: FontWeight.w600),
          SizedBox(height: 25),
          divider(),
          SizedBox(height: 25),
          eventCreatorWidget(
              'LOCATION :', eventDetail.location, Icons.add_location_outlined),
          SizedBox(height: 25),
          divider(),
          SizedBox(height: 25),
          contactUsWidget(),
          SizedBox(height: 25),
          divider(),
          SizedBox(height: 25),
          teamInfo(eventDetail),
          SizedBox(height: 25),
          divider(),
          SizedBox(height: 25),
          similarWidget(controller.eventList),


        ],
      ),
    );
  }

  Widget similarWidget(List<Event> list) {
    if(list.isEmpty) return Container();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SIMILAR EVENTS : ',
          style: TextStyle(
              color: Color(0xFF475464),
              fontWeight: FontWeight.w500,
              fontSize: 13),
        ),
        SizedBox(height: 16),
        SimilarEventWidget(eventList: list)
      ],
    );
  }
  Widget teamInfo(EventDetail eventDetail) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TEAM INFORMATION: ',
          style: TextStyle(
              color: Color(0xFF475464),
              fontWeight: FontWeight.w500,
              fontSize: 13),
        ),
        SizedBox(height: 16),
        Text(eventDetail.teamInformation ?? '', style: TextStyle(
            color: Color(0xFF475464),
            fontWeight: FontWeight.bold,
            fontSize: 16) )

      ],
    );
  }
  Widget contactUsWidget() {
    //Send us an email at contact@techalchemy.co or call us at +1 991-681-0200
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT :',
          style: TextStyle(
              color: Color(0xFF475464),
              fontWeight: FontWeight.w500,
              fontSize: 13),
        )
      ],
    );
  }

  Widget eventCreatorWidget(String title, String? message, IconData iconData,
      {FontWeight fontWeight = FontWeight.w500}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xFF475464),
              fontWeight: FontWeight.w500,
              fontSize: 13),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Icon(
              iconData,
              color: Color(0xFFDADADA),
            ),
            SizedBox(width: 8),
            Text(
              message ?? '',
              style: TextStyle(
                  color: Color(0xFF475464),
                  fontWeight: fontWeight,
                  fontSize: 16),
            )
          ],
        )
      ],
    );
  }

  Widget divider() {
    return Container(color: Color(0xFFE5E4EB), height: 1);
  }

  Widget aboutSection(EventDetail detail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABOUT :',
          style: TextStyle(
              letterSpacing: 1.2,
              wordSpacing: 4.0,
              color: Color(0xFF475464),
              fontWeight: FontWeight.w500,
              fontSize: 13),
        ),
        SizedBox(height: 16),
        Text(detail.description ?? '',
            style: TextStyle(
                letterSpacing: 1.2,
                wordSpacing: 4.0,
                color: Color(0xFF475464),
                fontSize: 15,
                fontWeight: FontWeight.w500))
      ],
    );
  }

  Widget venueSection(EventDetail detail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VENUE INFORMATION: :',
          style: TextStyle(
              letterSpacing: 1.2,
              wordSpacing: 4.0,
              color: Color(0xFF475464),
              fontWeight: FontWeight.w500,
              fontSize: 13),
        ),
        SizedBox(height: 16),
        Text(detail.venueInformation ?? '',
            style: TextStyle(
                letterSpacing: 1.2,
                wordSpacing: 4.0,
                color: Color(0xFF475464),
                fontSize: 15,
                fontWeight: FontWeight.w500))
      ],
    );
  }

  Widget tagRow() {
    var bc = Color(0xFFFDF7F8);
    var style = TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFD29489));
    return Row(
      children: [
        RoundedButton(
            title: '#sport',
            width: 70,
            height: 24,
            borderWidth: 0,
            buttonColor: bc,
            style: style),
        SizedBox(width: 10),
        RoundedButton(
            title: '#event',
            width: 70,
            height: 24,
            borderWidth: 0,
            buttonColor: bc,
            style: style),
        SizedBox(width: 10),
        RoundedButton(
            title: '#football',
            width: 70,
            height: 24,
            borderWidth: 0,
            buttonColor: bc,
            style: style),
      ],
    );
  }
}
