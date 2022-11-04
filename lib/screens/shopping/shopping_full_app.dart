/*
* File : Shopping App
* Version : 1.0.0
* */

import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'shopping_cart_screen.dart';
import 'shopping_home_screen.dart';
import 'shopping_profile_screen.dart';
import 'shopping_sale_screen.dart';
import 'shopping_search_screen.dart';

class ShoppingFullApp extends StatefulWidget {
  @override
  _ShoppingFullAppPageState createState() => _ShoppingFullAppPageState();
}

class _ShoppingFullAppPageState extends State<ShoppingFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

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
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
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
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          builder: (context, child) {
            return Directionality(
              textDirection: AppTheme.textDirection,
              child: child!,
            );
          },
          home: Scaffold(
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              color: customTheme.card,
              shape: CircularNotchedRectangle(),
              child: FxContainer(
                color: customTheme.card,
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
                                  MdiIcons.store,
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
                              MdiIcons.storeOutline,
                              color: theme.colorScheme.onBackground,
                            ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          left: Language.autoDirection(0, 20)!,
                          right: Language.autoDirection(20, 0)!,
                        ),
                        child: (_currentIndex == 1)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.magnify,
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
                                MdiIcons.magnify,
                                color: theme.colorScheme.onBackground,
                              )),
                    Container(
                        margin: EdgeInsets.only(
                          left: Language.autoDirection(20, 0)!,
                          right: Language.autoDirection(0, 20)!,
                        ),
                        child: (_currentIndex == 2)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.tag,
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
                                MdiIcons.tagOutline,
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
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ShoppingCartScreen();
                  }),
                );
              },
              child: Icon(
                MdiIcons.cartOutline,
                color: theme.colorScheme.primary,
              ),
              backgroundColor: theme.backgroundColor,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ShoppingHomeScreen(
                  rootContext: context,
                ),
                ShoppingSearchScreen(
                  rootContext: context,
                ),
                ShoppingSaleScreen(
                  rootContext: context,
                ),
                ShoppingProfileScreen()
              ],
            ),
          ),
        );
      },
    );
  }
}
