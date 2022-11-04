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

import 'account_bottom_sheet.dart';
import 'draggable_scrollable_bottom_sheet.dart';
import 'file_manager_bottom_sheet.dart';
import 'finger_print_lock_bottom_sheet.dart';
import 'gallery_bottom_sheet.dart';
import 'quick_action_bottom_sheet.dart';
import 'simple_bottom_sheet.dart';

class BottomSheetsScreen extends StatefulWidget {
  @override
  _BottomSheetsScreenState createState() => _BottomSheetsScreenState();
}

class _BottomSheetsScreenState extends State<BottomSheetsScreen> {
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
          'Bottom Sheet',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 7,
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
          body: TabBarView(children: getTabContents()),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Account',
      'Draggable',
      'File Manager',
      'Finger Print',
      'Gallery',
      'Quick Action',
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
      SimpleBottomSheet(),
      AccountBottomSheet(),
      DraggableScrollableBottomSheet(),
      FileManagerBottomSheet(),
      FingerprintLockBottomSheet(),
      GalleryBottomSheet(),
      QuickActionBottomSheet(),
    ];
  }
}
