import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'food_favourite_screen.dart';
import 'food_home_screen.dart';
import 'food_location_screen.dart';
import 'food_profile_screen.dart';

class FoodFullApp extends StatefulWidget {
  @override
  _FoodFullAppState createState() => _FoodFullAppState();
}

class _FoodFullAppState extends State<FoodFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: CircularNotchedRectangle(),
          child: FxCard(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: theme.colorScheme.primary,
                  tabs: <Widget>[
                    Container(
                      child: (_currentIndex == 0)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.food,
                                  color: theme.colorScheme.primary,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(
                              MdiIcons.food,
                              color: theme.colorScheme.onBackground,
                            ),
                    ),
                    Container(
                        child: (_currentIndex == 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.mapMarker,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.mapMarkerOutline,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        child: (_currentIndex == 2)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.heart,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.heartOutline,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        child: (_currentIndex == 3)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.account,
                                    color: theme.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: theme.primaryColor,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.accountOutline,
                                color: theme.colorScheme.onBackground,
                              )),
                  ]))),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          FoodHomeScreen(),
          FoodLocationScreen(
            rootContext: context,
          ),
          FoodFavouriteScreen(),
          FoodProfileScreen(
            rootContext: context,
          ),
        ],
      ),
    );
  }
}
