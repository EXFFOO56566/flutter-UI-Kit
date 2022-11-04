/*
* File : Social Profile
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
  ];
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 8; i++) {
      list.add(Container(
        child: Image(image: AssetImage(_imageList[i]), fit: BoxFit.fill),
      ));
    }

    list.add(FxContainer.none(
      splashColor: theme.colorScheme.primary.withAlpha(100),
      onTap: () {},
      color: theme.colorScheme.primary.withAlpha(28),
      child: Center(
        child: FxText.titleSmall("View All",
            color: theme.colorScheme.primary, fontWeight: 600),
      ),
    ));
    return list;
  }

  String _aboutText =
      "Lorem Ipsum: usage Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "./assets/images/profile/avatar_1.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  FxText.headlineSmall("Natalia Dyer",
                      fontWeight: 700, letterSpacing: 0),
                  FxText.titleSmall("UI Designer", fontWeight: 600),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FxContainer.bordered(
                          color: Colors.transparent,
                          borderRadiusAll: 4,
                          margin: EdgeInsets.only(left: 24, right: 12),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              FxText.titleMedium("3",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 700),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: FxText.labelSmall("Posts",
                                    fontWeight: 600, letterSpacing: 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: FxContainer.bordered(
                          color: Colors.transparent,
                          borderRadiusAll: 4,
                          margin: EdgeInsets.only(left: 12, right: 12),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              FxText.titleMedium("159",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 700),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: FxText.labelSmall("Followings",
                                    fontWeight: 600, letterSpacing: 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: FxContainer.bordered(
                          color: Colors.transparent,
                          borderRadiusAll: 4,
                          margin: EdgeInsets.only(left: 12, right: 24),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              FxText.titleMedium("357",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 700),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: FxText.labelSmall("Followers",
                                    fontWeight: 600, letterSpacing: 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.titleMedium("About",
                            letterSpacing: 0, fontWeight: 700),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: FxText.titleSmall(_aboutText,
                              letterSpacing: 0.1, fontWeight: 500, height: 1.3),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24),
                          child: FxText.titleMedium("Feed",
                              letterSpacing: 0, fontWeight: 700),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: GridView.count(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(bottom: 16),
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              children: _generateGridItems()),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: FxSpacing.safeAreaTop(context) + 20,
          left: 20,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
        )
      ],
    ));
  }
}
