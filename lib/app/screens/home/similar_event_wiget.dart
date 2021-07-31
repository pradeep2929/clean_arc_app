import 'package:alchemy/app/screens/home/event_widget.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SimilarEventWidget extends StatelessWidget {
  final List<Event> eventList;
  const SimilarEventWidget({Key? key, this.eventList = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
        constraints: new BoxConstraints(minHeight: 380.0, maxHeight: 420.0),
        child: Swiper(
            loop: false,
            outer: false,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(height: 370, child: EventWidget(event: eventList[index]));
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
}
