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

import 'blackout_date_range.dart';
import 'custom_date_range.dart';
import 'simple_date_range.dart';
import 'vertical_date_range.dart';

class DateRangesScreen extends StatefulWidget {
  @override
  _DateRangesScreenState createState() => _DateRangesScreenState();
}

class _DateRangesScreenState extends State<DateRangesScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
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
        title: FxText.titleMedium(
          'Date Range',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            toolbarHeight: 48,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(isScrollable: true, tabs: getTabs())
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: Container(
            padding: FxSpacing.all(8),
            child: TabBarView(children: getTabContents()),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Blackout',
      'Customization',
      'Vertical - Scrollable',
    ];

    List<Tab> tabs = [];

    for (String tabName in tabNames) {
      tabs.add(Tab(
          child: FxText.labelMedium(
        tabName,
        fontWeight: 700,
      )));
    }

    return tabs;
  }

  List<Widget> getTabContents() {
    return [
      SimpleDateRange(),
      BlackoutDateRange(),
      CustomDateRange(),
      VerticalDateRange(),
    ];
  }
}
