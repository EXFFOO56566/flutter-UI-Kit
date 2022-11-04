import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/widgets/cupertino/dialog/cupertino_action_sheet_screen.dart';
import 'package:flutkit/widgets/cupertino/dialog/cupertino_alert_dialog_screen.dart';

import 'cupertino_dialog_screen.dart';

class CupertinoDialogsScreen extends StatefulWidget {
  @override
  _CupertinoDialogsScreenState createState() => _CupertinoDialogsScreenState();
}

class _CupertinoDialogsScreenState extends State<CupertinoDialogsScreen> {
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
          'Cupertino Dialogs',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 3,
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
      'Dialog',
      'Alert',
      'Action Sheet',
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
      CupertinoDialogScreen(),
      CupertinoAlertDialogScreen(),
      CupertinoActionSheetScreen(),
    ];
  }
}
