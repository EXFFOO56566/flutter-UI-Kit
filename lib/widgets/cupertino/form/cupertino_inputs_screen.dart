import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'cupertino_button_screen.dart';
import 'cupertino_date_time_picker_screen.dart';
import 'cupertino_picker_screen.dart';
import 'cupertino_slider_screen.dart';
import 'cupertino_switch_screen.dart';
import 'cupertino_textfield_screen.dart';
import 'cupertino_time_picker_screen.dart';
import 'cupertino_timer_screen.dart';

import 'cupertino_date_picker_screen.dart';

class CupertinoInputsScreen extends StatefulWidget {
  @override
  _CupertinoInputsScreenState createState() => _CupertinoInputsScreenState();
}

class _CupertinoInputsScreenState extends State<CupertinoInputsScreen> {
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
          'Cupertino Inputs',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 9,
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
          body: TabBarView(children: getTabContents()),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Buttons',
      'Text Field',
      'Slider',
      'Switch',
      'Picker',
      'Date',
      'Time',
      'Date-Time',

      'Timer',
      // 'Selectable',
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
      CupertinoButtonScreen(),
      CupertinoTextFieldScreen(),
      CupertinoSliderScreen(),
      CupertinoSwitchScreen(),
      CupertinoPickerScreen(),
      CupertinoDatePickerScreen(),
      CupertinoTimePickerScreen(),
      CupertinoDateTimePickerScreen(),
      CupertinoTimerPickerScreen(),
    ];
  }
}
