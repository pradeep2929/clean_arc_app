import 'package:alchemy/app/resource/rounded_button.dart';
import 'package:alchemy/domain/entities/event_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventTopBannerWidget extends StatelessWidget {

  final String? mainImage;
  final bool? isPartnered;
  final String? sport;
  final String? name;
  final String? dateTime;
  final dynamic price;
  
  const EventTopBannerWidget({Key? key, this.name, this.dateTime, this.price, @required this.mainImage, this.isPartnered = false, this.sport, }) : super(key: key);

  @override

  Widget build(BuildContext context) {
      var boldButtonStyle = TextStyle(
          fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold);
      return Container(
        height: 186,
        width: double.infinity,
        padding: EdgeInsets.only(top: 40, left: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: mainImage == null ? null : DecorationImage(
              fit: BoxFit.cover, image: CachedNetworkImageProvider(mainImage ?? '')),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.0), topRight: Radius.circular(26.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                RoundedButton(
                  title: (isPartnered ?? false) ? 'Partnered' : '',
                  style: boldButtonStyle,
                  width: 80,
                  height: 22,
                  borderWidth: 0.0,
                  onPress: () {},
                  buttonColor: Color(0xFF02D9E7),
                ),
                SizedBox(width: 10),
                RoundedButton(
                  title: sport ?? '',
                  borderWidth: 0.0,
                  height: 22,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                  buttonColor: Colors.white,
                  onPress: () {},
                  width: 60,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 32),
              child: Text(
                name ?? '',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.access_time_rounded, color: Colors.white),
                SizedBox(width: 12),
                Text(dateTime ?? '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedButton(
                        title: '\£${price}',
                        borderWidth: 0.0,
                        height: 36,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.0),
                            bottomLeft: Radius.circular(18.0)),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        buttonColor: Color(0xFF02D9E7),
                        onPress: () {},
                        width: 90,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
  }
}
