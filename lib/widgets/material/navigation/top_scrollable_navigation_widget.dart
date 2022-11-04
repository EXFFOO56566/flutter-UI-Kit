/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

class TopScrollableNavigationWidget extends StatefulWidget {
  @override
  _TopScrollableNavigationWidgetState createState() =>
      _TopScrollableNavigationWidgetState();
}

class _TopScrollableNavigationWidgetState
    extends State<TopScrollableNavigationWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(FeatherIcons.chevronLeft).autoDirection(),
        ),
        title: FxText.titleMedium("Top Scrollable", fontWeight: 600),
      ),
      body: DefaultTabController(
        length: 8,
        initialIndex: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(child: FxText.titleMedium("Tab 1", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 2", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 3", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 4", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 5", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 6", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 7", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 8", fontWeight: 600)),
                  ],
                )
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(
            children: <Widget>[
              getTabContent('Tab 1'),
              getTabContent('Tab 2'),
              getTabContent('Tab 3'),
              getTabContent('Tab 4'),
              getTabContent('Tab 5'),
              getTabContent('Tab 6'),
              getTabContent('Tab 7'),
              getTabContent('Tab 8'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: FxText.titleMedium(text, fontWeight: 600),
      ),
    );
  }
}
