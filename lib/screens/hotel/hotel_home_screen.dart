/*
* File : Hotel Home
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/screens/hotel/hotel_room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HotelHomeScreen extends StatefulWidget {
  final BuildContext buildContext;

  const HotelHomeScreen({Key? key, required this.buildContext})
      : super(key: key);

  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation<Offset>? offset;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    offset = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));
  }

  dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
          child: Column(
            children: <Widget>[
              _SearchWidget(),
              FxSpacing.height(20),
              Expanded(
                flex: 1,
                child: ListView(
                  shrinkWrap: true,
                  padding: FxSpacing.zero,
                  children: <Widget>[
                    Container(
                        child: _SingleHotelItem(
                      image: './assets/images/apps/hotel/room-1.jpg',
                      name: "Mandarin Oriental",
                      price: 400,
                      address: "Wartennal, London ",
                      rating: 4.4,
                      buildContext: widget.buildContext,
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: _SingleHotelItem(
                          image: './assets/images/apps/hotel/room-2.jpg',
                          name: "Moody Moon",
                          price: 700,
                          address: "Duck Creek Road",
                          rating: 4.8,
                          buildContext: widget.buildContext,
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: _SingleHotelItem(
                          buildContext: widget.buildContext,
                          image: './assets/images/apps/hotel/room-3.jpg',
                          name: "Four Seasons Hotel",
                          price: 340,
                          address: "Juniper Drive",
                          rating: 3.8,
                        )),
                    Container(
                      padding: EdgeInsets.only(
                        top: 16,
                      ),
                      child: Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary),
                              strokeWidth: 1.5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _SearchWidget extends StatelessWidget {
  _pickDate(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FxContainer.bordered(
      marginAll: 0,
      color: Colors.transparent,
      paddingAll: 0,
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    style: FxTextStyle.titleSmall(
                      fontWeight: 500,
                    ),
                    decoration: InputDecoration(
                      hintStyle: FxTextStyle.titleSmall(fontWeight: 500),
                      hintText: "Hotels near me",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        MdiIcons.magnify,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 14),
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.sentences,
                    controller: TextEditingController(text: ""),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16),
                  child: InkWell(
                    onTap: () {
                      _pickDate(context);
                    },
                    child: Icon(
                      MdiIcons.calendarOutline,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              height: 0,
              color: theme.dividerColor,
            ),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.bodySmall("Check in", fontWeight: 500),
                            FxText.bodyLarge("28 May", fontWeight: 600),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.bodySmall("Check out", fontWeight: 500),
                            FxText.bodyLarge("31 May", fontWeight: 600),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.bodySmall("Person", fontWeight: 500),
                            FxText.bodyLarge("2 Couple", fontWeight: 600),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleHotelItem extends StatefulWidget {
  final String name, address, image;
  final int price;
  final double rating;
  final BuildContext buildContext;

  const _SingleHotelItem(
      {Key? key,
      required this.name,
      required this.address,
      required this.image,
      required this.price,
      required this.rating,
      required this.buildContext})
      : super(key: key);

  @override
  _SingleHotelItemState createState() => _SingleHotelItemState();
}

class _SingleHotelItemState extends State<_SingleHotelItem> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.buildContext,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) =>
                    FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                pageBuilder: (_, __, ___) => HotelRoomScreen()));
      },
      child: FxContainer(
        paddingAll: 0,
        borderRadiusAll: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                child: Image(
                  image: AssetImage(widget.image),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                )),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FxText.titleMedium(widget.name, fontWeight: 600),
                      FxText.titleMedium("\$" + widget.price.toString(),
                          fontWeight: 600),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.mapMarker,
                                  color: theme.colorScheme.onBackground,
                                  size: 14,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: FxText.bodySmall(widget.address,
                                        fontWeight: 500)),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Row(
                                children: <Widget>[
                                  Icon(MdiIcons.star,
                                      color: theme.colorScheme.onBackground,
                                      size: 14),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: FxText.bodySmall(
                                        widget.rating.toString() + " Ratings",
                                        fontWeight: 500),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  widget.buildContext,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 500),
                                      transitionsBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                      ) =>
                                          FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                      pageBuilder: (_, __, ___) =>
                                          HotelRoomScreen()));
                            },
                            child: FxText.bodySmall("BOOK NOW",
                                fontWeight: 600,
                                color: theme.colorScheme.primary)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
