import 'package:alchemy/app/screens/home/event_top_banner.dart';
import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:flutter/material.dart';

class EventDetailsHeader extends StatelessWidget {

  final double maxHeight;
  final double minHeight;
  final EventDetail? eventDetail;
  const EventDetailsHeader({Key? key, this.eventDetail, this.maxHeight = 300, this.minHeight=100}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);
        return Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(),
            _buildGradient(animation),
            Align(
              alignment: Alignment.bottomCenter,
              child: EventTopBannerWidget(
                price: eventDetail?.price,
                name: eventDetail?.name,
                dateTime: eventDetail?.dateTime,
                mainImage: null,
                isPartnered: eventDetail?.isPartnered,
                sport: eventDetail?.sport,
              ),
            )
          ],
        );
      },
    );
  }
  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - minHeight) / ( maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Container _buildGradient(Animation<double> animation) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorTween(begin: Colors.black87, end: Colors.black38).evaluate(animation) ?? Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }


  Image _buildImage() {
    return Image.network(
      eventDetail?.mainImage ?? '',
      fit: BoxFit.cover,
    );
  }
}
