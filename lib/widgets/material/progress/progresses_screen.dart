import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'create_account_progress.dart';
import 'fail_progress.dart';
import 'internet_check_progress.dart';
import 'payment_progress.dart';
import 'upload_progress.dart';

class ProgressesScreen extends StatefulWidget {
  @override
  _ProgressesScreenState createState() => _ProgressesScreenState();
}

class _ProgressesScreenState extends State<ProgressesScreen> {
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
          'Progresses',
          fontWeight: 600,
        ),
      ),
      body: DefaultTabController(
        length: 5,
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
      'Account',
      'Fail',
      'Internet',
      'Payment',
      'Upload',
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
      CreateAccountProgress(),
      FailProgress(),
      InternetProgress(),
      PaymentProgress(),
      UploadProgress(),
    ];
  }
}
