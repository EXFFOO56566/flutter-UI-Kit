/*
* File : FAB with Tabs
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class FABWithTabsWidget extends StatefulWidget {
  @override
  _FABWithTabsWidgetState createState() => _FABWithTabsWidgetState();
}

class _FABWithTabsWidgetState extends State<FABWithTabsWidget>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabIndex);
  }

  TabController? _tabController;

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabIndex);
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: FxText.bodyLarge("Tab 1", fontWeight: 600),
            ),
            Tab(
              child: FxText.bodyLarge("Tab 2", fontWeight: 600),
            ),
          ],
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            FeatherIcons.chevronLeft,
            size: 20,
          ),
        ),
        title: FxText.titleMedium("FAB with Tabs", fontWeight: 600),
      ),
      floatingActionButton: _bottomButtons(),
      body: TabBarView(controller: _tabController, children: [
        Center(
          child: Container(
            child: FxText('Tab 1'),
          ),
        ),
        Center(
          child: Container(
            child: FxText('Tab 2'),
          ),
        ),
      ]),
    );
  }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: FxText.titleLarge(text, color: theme.colorScheme.onBackground),
      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController!.index == 0
        ? FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            child: Icon(
              Icons.message,
              size: 22.0,
              color: theme.colorScheme.onPrimary,
            ))
        : FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            child: Icon(
              Icons.edit,
              size: 22.0,
              color: theme.colorScheme.onPrimary,
            ),
          );
  }
}
