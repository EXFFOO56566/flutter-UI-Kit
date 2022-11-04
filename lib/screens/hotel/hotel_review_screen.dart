/*
* File : Hotel Review
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HotelReviewScreen extends StatefulWidget {
  @override
  _HotelReviewScreenState createState() => _HotelReviewScreenState();
}

class _HotelReviewScreenState extends State<HotelReviewScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0, _numPages = 3;
  late CustomTheme customTheme;
  late ThemeData theme;

  final PageController _pageController = PageController(initialPage: 0);
  late Timer timerAnimation;

  List<String> _commentType = [
    "Motels",
    "Low Cost",
    "Suburb",
    "City Center",
    "Service",
    "Other",
  ];

  List<String> _selectedChoices = [
    "Service",
    "Suburb",
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        padding: EdgeInsets.zero,
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
                top: FxSpacing.safeAreaTop(context),
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
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FxText.titleMedium("Mandarin Oriental", fontWeight: 600),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.mapMarker,
                            color: theme.colorScheme.onBackground,
                            size: 20,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 2),
                              child: FxText.bodyMedium("London bridge",
                                  fontWeight: 500)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FxText.titleSmall("4.6", fontWeight: 500),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: FxStarRating(
                                rating: 4.6,
                                inactiveColor: theme.colorScheme.onBackground),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Divider(
              color: theme.dividerColor,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20, top: 8),
              child: FxText.bodySmall("REVIEWS",
                  fontWeight: 600, letterSpacing: 0.3)),
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 8, right: 20),
            child: Wrap(
              children: _buildChoiceList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 20),
            child: Column(
              children: <Widget>[
                _SingleReview(
                    image: './assets/images/profile/avatar.jpg',
                    name: 'Jeevan Bouvet',
                    review:
                        'Lorem ipsum is a pseudo-Latin text used in web design,'),
                _SingleReview(
                    image: './assets/images/profile/avatar_4.jpg',
                    name: 'Omer Nichols',
                    review:
                        'metus dictum. Faucibus interdum posuere lorem ipsum'),
                _SingleReview(
                    image: './assets/images/profile/avatar_2.jpg',
                    name: 'Safah French',
                    review: ' Amet venenatis urna cursus eget.'),
                Container(
                  child: Center(
                    child: TextButton(
                        onPressed: () {},
                        child: FxText.bodyMedium("VIEW ALL",
                            fontWeight: 600,
                            color: theme.colorScheme.primary,
                            letterSpacing: 0.4)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    _commentType.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.only(left: 2, right: 2, top: 4, bottom: 4),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: theme.colorScheme.primary,
          backgroundColor: theme.colorScheme.background,
          label: FxText.bodyMedium(item,
              color: _selectedChoices.contains(item)
                  ? theme.colorScheme.onSecondary
                  : theme.colorScheme.onBackground),
          selected: _selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedChoices.contains(item)
                  ? _selectedChoices.remove(item)
                  : _selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }
}

class _SingleReview extends StatelessWidget {
  final String image, name, review;

  const _SingleReview(
      {Key? key, required this.image, required this.name, required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(name, fontWeight: 500),
                  Container(
                      margin: EdgeInsets.only(top: 4),
                      child: FxText.labelMedium("- " + review,
                          height: 1.15, fontWeight: 400)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
