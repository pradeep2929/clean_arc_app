import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ParallaxScroll extends StatefulWidget {
  ParallaxScroll({Key? key, this.title}): super(key: key);

  final String? title;

  @override
  _ParallaxScrollState createState() => _ParallaxScrollState();
}

class _ParallaxScrollState extends State<ParallaxScroll> {
  List<String> choices = ['Item1', 'Item2', 'Item3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, isInnerBoxScrolled) {
              return [
                getAppbar(),
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: UserNameRowWidget(
                      displayName: 'DLT Labs',
                      userName: 'dlt_labs',
                      bio: 'A Software company',
                      location: 'Sector 6, Noida',
                      createdAt: '15 June 2021',
                    ),
                  ),
                ),
              ];
            }, body: Builder(builder: (context) {
          return CustomScrollView(slivers: [
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return ListTile(
                    title: Text(
                      'Element $index',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  );
                },
                childCount: 10,
              ),
              itemExtent: 56.0,
            )
          ]);
        })));
  }

  SliverAppBar getAppbar() {
    return SliverAppBar(
        expandedHeight: 200,
        pinned: true,
        elevation: 0,
        stretch: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return choices.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          })
        ],
        flexibleSpace: FlexibleSpaceBar(
            stretchModes: <StretchMode>[
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
            background: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                SizedBox.expand(
                    child: Container(
                      padding: EdgeInsets.only(top: 50),
                      height: 30,
                      color: Colors.white,
                    )),
                Container(
                    height: 180,
                    padding: EdgeInsets.only(top: 28),
                    child: loadCacheImage(
                      'https://pbs.twimg.com/profile_banners/457684585/1510495215/1500x500',
                      fit: BoxFit.fill,
                    )),
                Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.white, width: 5),
                                shape: BoxShape.circle),
                            child: RippleButton(
                              child: loadProfileImage(
                                'https://image.shutterstock.com/image-photo/milan-italynovember-18-2004-microsoft-600w-247513390.jpg',
                              ),
                              borderRadius: BorderRadius.circular(50),
                              onPressed: () {},
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 90, right: 30),
                            child: Row(
                              children: <Widget>[
                                RippleButton(
                                    splashColor: Colors.blue.withAlpha(100),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    onPressed: () {},
                                    child: Container(
                                        height: 35,
                                        width: 35,
                                        padding: EdgeInsets.only(
                                            bottom: 5,
                                            top: 0,
                                            right: 0,
                                            left: 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blue, width: 1),
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          IconData(0xf187),
                                          color: Colors.blue,
                                          size: 20,
                                        ))),
                                SizedBox(width: 10),
                                RippleButton(
                                    splashColor: Colors.blue.withAlpha(100),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                    onPressed: () {},
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.blue, width: 1),
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: Text('Edit Profile',
                                            style: TextStyle(
                                              color:
                                              Colors.black87.withAlpha(180),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ))))
                              ],
                            ))
                      ],
                    ))
              ],
            )));
  }

  loadCacheImage(path, {BoxFit fit = BoxFit.contain}) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: path,
      height: 80,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholderFadeInDuration: Duration(milliseconds: 500),
      placeholder: (context, url) => Container(
        color: Color(0xffeeeeee),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  Widget loadProfileImage(
      String path, {
        double height = 50,
        bool isBorder = false,
      }) {
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
          Border.all(color: Colors.grey.shade100, width: isBorder ? 2 : 0),
        ),
        child: CircleAvatar(
          maxRadius: height / 2,
          backgroundColor: Theme.of(context).cardColor,
          backgroundImage: CachedNetworkImageProvider(path),
        ));
  }
}

class UserNameRowWidget extends StatelessWidget {
  const UserNameRowWidget({
    Key? key,
    @required this.displayName,
    @required this.userName,
    @required this.bio,
    @required this.createdAt,
    @required this.location,
  }) : super(key: key);

  final String? displayName;
  final String? userName;
  final String? bio;
  final String? location;
  final String? createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(children: <Widget>[
                Text(displayName ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    )),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  IconData(0xf099),
                  color: Colors.blue,
                  size: 16,
                )
              ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                '$userName',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                bio ?? '',
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.location_pin, size: 14),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text(
                          location ?? '',
                          style: TextStyle(color: Colors.grey),
                        ))
                  ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(children: <Widget>[
                Icon(Icons.calendar_today, size: 14),
                SizedBox(width: 10),
                Text(
                  createdAt ?? '',
                  style: TextStyle(color: Colors.grey),
                )
              ])),
          Container(
              alignment: Alignment.center,
              child: Row(children: <Widget>[
                SizedBox(
                  width: 10,
                  height: 30,
                ),
                Text(
                  '10 Followers',
                  style: TextStyle(fontSize: 14, color: Colors.lightBlueAccent),
                ),
                SizedBox(width: 40),
                Text('10 Following',
                    style:
                    TextStyle(fontSize: 14, color: Colors.lightBlueAccent))
              ]))
        ]);
  }
}

class RippleButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final BorderRadius? borderRadius;
  final Color? splashColor;

  RippleButton(
      {Key? key,
        this.child,
        this.onPressed,
        this.borderRadius = const BorderRadius.all(Radius.circular(0)),
        this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      child ?? Container(),
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: FlatButton(
            splashColor: splashColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(0))),
            onPressed: () {
              if (onPressed != null) {
                onPressed?.call();
              }
            },
            child: Container()),
      )
    ]);
  }
}
