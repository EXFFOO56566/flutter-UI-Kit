import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'range_selector/range_selector_bar_screen.dart';
import 'range_selector/range_selector_screen.dart';
import 'range_selector/range_selector_selection_screen.dart';
import 'range_selector/range_selector_zooming_screen.dart';

class RangeSelectorsScreen extends StatefulWidget {
  @override
  _RangeSelectorsScreenState createState() => _RangeSelectorsScreenState();
}

class _RangeSelectorsScreenState extends State<RangeSelectorsScreen> {
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
          'Range Selector',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            automaticallyImplyLeading: false,
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
    List<String> tabNames = ['Default', 'Selection', 'Zooming', 'Bar'];

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
      RangeSelectorScreen(),
      RangeSelectorSelectionScreen(),
      RangeSelectorZoomingScreen(),
      RangeSelectorBarScreen()
    ];
  }
}
