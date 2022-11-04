import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'account_dialog.dart';
import 'add_contact_dialog.dart';
import 'comment_dialog.dart';
import 'import_contact_dialog.dart';
import 'permission_dialog.dart';
import 'policy_dialog.dart';
import 'post_dialog.dart';
import 'simple_dialog_screen.dart';

class DialogsScreen extends StatefulWidget {
  @override
  _DialogsScreenState createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {
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
          'Dialogs',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 8,
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
              padding: FxSpacing.all(16),
              child: TabBarView(children: getTabContents())),
        ),
      ),
    );
  }

  List<Tab> getTabs() {
    List<String> tabNames = [
      'Simple',
      'Policy',
      'Account',
      'Add Contact',
      'Comment',
      'Post',
      'Import Contact',
      'Permission',
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
      SimpleDialogScreen(),
      PolicyDialog(),
      AccountDialog(),
      AddContactDialog(),
      CommentDialog(),
      PostDialog(),
      ImportContactDialog(),
      PermissionDialog(),
    ];
  }
}
