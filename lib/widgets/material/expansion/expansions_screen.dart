import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'expansion_panel_screen.dart';
import 'expansion_tile_screen.dart';
import 'invoice_expansion.dart';

class ExpansionsScreen extends StatefulWidget {
  @override
  _ExpansionsScreenState createState() => _ExpansionsScreenState();
}

class _ExpansionsScreenState extends State<ExpansionsScreen> {
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
          icon: Icon(
            FeatherIcons.chevronLeft,
            size: 20,
          ),
        ),
        title: FxText.titleMedium(
          'Expansions',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            toolbarHeight: 48,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*-------------- Build Tabs here ------------------*/
                TabBar(
                  tabs: getTabs(),
                  isScrollable: true,
                )
              ],
            ),
          ),

          /*--------------- Build Tab body here -------------------*/
          body: TabBarView(
            children: getTabContents(),
          ),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Panel',
      'Tile',
      'Invoice',
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
      ExpansionPanelScreen(),
      ExpansionTileScreen(),
      InvoiceExpansion(),
    ];
  }
}
