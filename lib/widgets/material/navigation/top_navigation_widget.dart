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

class TopNavigationWidget extends StatefulWidget {
  @override
  _TopNavigationWidgetState createState() => _TopNavigationWidgetState();
}

class _TopNavigationWidgetState extends State<TopNavigationWidget> {
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
        title: FxText.titleMedium("Top Navigation", fontWeight: 600),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(
                  tabs: [
                    Tab(child: FxText.titleMedium("Tab 1", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 2", fontWeight: 600)),
                    Tab(child: FxText.titleMedium("Tab 3", fontWeight: 600)),
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
              getTabContent('Tab 3')
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
