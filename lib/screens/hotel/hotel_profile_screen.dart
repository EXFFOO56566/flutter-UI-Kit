/*
* File : Hotel Profile
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HotelProfileScreen extends StatefulWidget {
  @override
  _HotelProfileScreenState createState() => _HotelProfileScreenState();
}

class _HotelProfileScreenState extends State<HotelProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.only(
          top: FxSpacing.safeAreaTop(context) + 20, left: 16, right: 16),
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: FxContainer(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    "./assets/images/profile/avatar_2.jpg",
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleLarge("Milton Garcia",
                          fontWeight: 600, letterSpacing: 0),
                      FxText.bodyLarge("mile@gmail.com",
                          fontWeight: 400, letterSpacing: 0.2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        FxSpacing.height(20),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              FxContainer.bordered(
                color: Colors.transparent,
                padding:
                    EdgeInsets.only(top: 12, bottom: 16, left: 16, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FxText.titleMedium("My Information",
                            fontWeight: 500),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child:
                            FxText.titleMedium("My Booking", fontWeight: 500),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FxText.titleMedium("Payment Method",
                            fontWeight: 500),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FxText.titleMedium("Setting", fontWeight: 500),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              FxContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: FxText.titleMedium("Logout", fontWeight: 600),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
