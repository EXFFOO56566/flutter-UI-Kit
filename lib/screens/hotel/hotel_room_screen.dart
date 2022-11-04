/*
* File : Hotel Room
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/screens/hotel/hotel_review_screen.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HotelRoomScreen extends StatefulWidget {
  @override
  _HotelRoomScreenState createState() => _HotelRoomScreenState();
}

class _HotelRoomScreenState extends State<HotelRoomScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0, _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  late Timer timerAnimation;
  late CustomTheme customTheme;
  late ThemeData theme;

  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    timerAnimation = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timerAnimation.cancel();
    _pageController.dispose();
  }

  final String _aboutText =
      "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  Container(
                    child: Image(
                      image:
                          AssetImage('./assets/images/apps/hotel/room-1.jpg'),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Image(
                      image:
                          AssetImage('./assets/images/apps/hotel/room-2.jpg'),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Image(
                      image:
                          AssetImage('./assets/images/apps/hotel/room-3.jpg'),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 24,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  MdiIcons.chevronLeft,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium("Mandarin Oriental",
                        fontWeight: 600, letterSpacing: 0),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.mapMarker,
                            color: theme.colorScheme.onBackground,
                            size: 16,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 2),
                              child: FxText.bodySmall("London bridge",
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: theme.colorScheme.primary.withAlpha(24),
                      child: InkWell(
                        splashColor: theme.colorScheme.primary.withAlpha(100),
                        highlightColor: theme.primaryColor.withAlpha(20),
                        child: SizedBox(
                            width: 44,
                            height: 44,
                            child: Icon(
                              MdiIcons.shareOutline,
                              size: 22,
                              color: theme.colorScheme.primary.withAlpha(240),
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: ClipOval(
                      child: Material(
                        color: theme.colorScheme.primary.withAlpha(24),
                        child: InkWell(
                          highlightColor: theme.primaryColor.withAlpha(20),
                          splashColor: theme.primaryColor.withAlpha(100),
                          child: SizedBox(
                              width: 44,
                              height: 44,
                              child: Icon(
                                MdiIcons.heartOutline,
                                size: 20,
                                color: theme.colorScheme.primary,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium("Price", fontWeight: 500),
                  FxText.bodyMedium("350 \$", fontWeight: 700)
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium("Rating", fontWeight: 500),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FxText.bodyMedium("4.6", fontWeight: 700),
                        Container(
                            margin: EdgeInsets.only(left: 4),
                            child: FxStarRating(rating: 4.1))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: _FacilityWidget(
                    iconData: MdiIcons.currencyUsd,
                    text: "Low Cost",
                  )),
                  Expanded(
                      child: _FacilityWidget(
                    iconData: MdiIcons.car,
                    text: "Parking",
                  )),
                  Expanded(
                      child: _FacilityWidget(
                    iconData: MdiIcons.partyPopper,
                    text: "Party",
                  )),
                  Expanded(
                      child: _FacilityWidget(
                    iconData: MdiIcons.theater,
                    text: "Theater",
                  )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: _FacilityWidget(
                      iconData: MdiIcons.glassWine,
                      text: "Bar",
                    )),
                    Expanded(
                        child: _FacilityWidget(
                      iconData: MdiIcons.pool,
                      text: "Pool",
                    )),
                    Expanded(
                        child: _FacilityWidget(
                      iconData: MdiIcons.spa,
                      text: "Spa",
                    )),
                    Expanded(
                        child: _FacilityWidget(
                      iconData: MdiIcons.gamepad,
                      text: "Games",
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FxText.titleMedium("About", fontWeight: 600),
              Container(
                  margin: EdgeInsets.only(top: 8),
                  child: FxText.bodyMedium(_aboutText, fontWeight: 500))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8, top: 8),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
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
                          pageBuilder: (_, __, ___) => HotelReviewScreen()));
                },
                child: FxText.bodyMedium("REVIEW",
                    fontWeight: 600, color: theme.colorScheme.primary)),
          ),
        ),
      ],
    ));
  }
}

class _FacilityWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const _FacilityWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FxContainer.bordered(
      margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: theme.colorScheme.primary,
              size: 28,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodySmall(text,
                  letterSpacing: 0,
                  fontWeight: 600,
                  color: theme.colorScheme.onBackground),
            )
          ],
        ),
      ),
    );
  }
}
