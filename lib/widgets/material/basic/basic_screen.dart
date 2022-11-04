import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'choice_chip_screen.dart';
import 'flutx_two_tone_icons_screen.dart';
import 'grid_action_screen.dart';
import 'grid_hero_screen.dart';
import 'grid_screen.dart';
import 'simple_chip_screen.dart';
import 'snackbar_screen.dart';

class BasicScreen extends StatefulWidget {
  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
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
          ).autoDirection(),
        ),
        title: FxText.titleMedium(
          'Basic',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 7,
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
                TabBar(isScrollable: true, tabs: getTabs())
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
      'Two-Tone',
      'Chip',
      'Choice Chip',
      'Grid',
      'Hero',
      'Actions',
      'Snackbars',
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
      FxTwoToneIconsScreen(),
      SimpleChipScreen(),
      ChoiceChipScreen(),
      GridScreen(),
      GridHeroScreen(),
      GridActionScreen(),
      SnackBarScreen(),
    ];
  }
}
