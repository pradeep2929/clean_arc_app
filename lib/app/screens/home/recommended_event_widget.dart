import 'package:alchemy/app/resource/rounded_button.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../base_screen.dart';

class RecommendedEventWidget extends BaseStateLessWidget {
  final List<Event> eventList;

  RecommendedEventWidget({Key? key, this.eventList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF9F6F6),
        constraints: new BoxConstraints(minHeight: 204.0, maxHeight: 204.0),
        child: Swiper(
            loop: false,
            outer: false,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              return _recommendedEventWidget(eventList[index]);
            },
            itemCount: eventList.length,
            pagination: new SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: new DotSwiperPaginationBuilder(
                  size: 8,
                  color: Color(0xFFE4DDDD),
                  activeColor: Color(0xff475464)),
            )));
  }

  Widget _recommendedEventWidget(Event event) {
    String ticketTitle = '${event.ticketsSold}/${event.maxTickets}';
    var ticketWidget =
        Icon(Icons.airplane_ticket_outlined, size: 12,color: Colors.white);

    String friendsAttending = (event.friendsAttending ?? 0) > 2
        ? '+${event.friendsAttending} friends'
        : '${event.friendsAttending} friends';
    var friendsIcons = Icon(Icons.person_outline, size: 12, color: Colors.white);

    var boldButtonStyle = TextStyle(
        fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold);

    return Column(
      children: [
        Container(
          height: 160,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                fit: BoxFit.cover, image: CachedNetworkImageProvider(event.mainImage ?? '')),
            borderRadius: BorderRadius.all(Radius.circular(26.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0, left: 22, right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, color: Colors.white),
                    SizedBox(width: 12),
                    Text(event.dateTime ?? '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600))
                  ],
                ),
                SizedBox(height: 14),
                Text(event.name ?? '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 26),
                SizedBox(
                    height: 28,
                    child: Row(
                      children: [
                        RoundedButton(
                            title: ticketTitle,
                            width: 65,
                            onPress: (){},
                            icon: ticketWidget,
                            style: boldButtonStyle),
                        SizedBox(width: 7),
                        RoundedButton(title: friendsAttending, onPress: (){}, width: 117, icon: friendsIcons),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RoundedButton(title: '\£${event.price}',
                                  width: 62, onPress: (){},
                                  borderWidth: 0.0,
                                  buttonColor: Color(0xFF02D9E7),style: boldButtonStyle)
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
