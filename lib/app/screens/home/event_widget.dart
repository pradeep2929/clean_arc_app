import 'package:alchemy/app/resource/app_colors.dart';
import 'package:alchemy/app/resource/heart_buttton.dart';
import 'package:alchemy/app/resource/rounded_button.dart';
import 'package:alchemy/app/screens/base_screen.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:alchemy/utils/app_date_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alchemy/app/navigation/routes.dart';

import 'event_top_banner.dart';

class EventWidget extends StatefulWidget {
  final Event? event;

  EventWidget({Key? key, @required this.event}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EventWidgetState(this.event);
}

class _EventWidgetState extends BaseStatefulState<EventWidget> {
  Event? event;

  _EventWidgetState(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      margin: EdgeInsets.only(bottom: 10, top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(26.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1// changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: (){
          Get.toNamed(Routes.eventDetail);
        },
        child: Column(
          children: [EventTopBannerWidget(mainImage:event?.mainImage,
            name: event?.name,
            dateTime: event?.dateTime,
            sport: event?.sport,
            isPartnered: event?.isPartnered,
            price: event?.price,), bottomDetailsWidget()],
        ),
      ),
    );
  }

  Widget bottomDetailsWidget() {
    return Container(
      padding: EdgeInsets.all(22),
      child: Column(
        children: [
          Row(
            children: [
              Text('total_price'.tr,
                  style: TextStyle(
                      color: Color(0xFF475464),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              Text(' \£${event?.totalPrize}',
                  style: TextStyle(
                      color: Color(0xFF475464),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Icon(Icons.ios_share, size: 22),
                    SizedBox(width: 24),
                    HeartButton()
                  ]))
            ],
          ),
          SizedBox(height: 20),
          Row(children: [
            Icon(Icons.access_time_rounded, color: Color(0xfF595959)),
            SizedBox(width: 8),
            Text('time_left_to_book'.tr,
                style: TextStyle(
                    color: Color(0xFF02D9E7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            Text(AppDateUtils.getTimeDifferenceToCurrent(event?.bookBy),
                style: TextStyle(
                    color: Color(0xFF475464),
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ],),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.airplane_ticket, color: Color(0xfF475464)),
              SizedBox(width: 8),
              Text('${event?.friendsAttending}/${event?.maxTickets} ' + 'attending_total'.tr,
                  style: TextStyle(
                      color: AppColors.tabActive,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color:  Color(0xfF475464)),
              SizedBox(width: 8),
              Flexible(
                child: Text(event?.location ?? '',
                    softWrap: true,
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 14, color: Color(0xFF475464))),
              )
            ],
          )
        ],
      ),
    );
  }
}
