import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'address_form.dart';
import 'date_timer_picker_screen.dart';
import 'feedback_form.dart';
import 'form_screen.dart';
import 'personal_information_form.dart';

class InputsScreen extends StatefulWidget {
  @override
  _InputsScreenState createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
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
          'Inputs',
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
      'Sample',
      'Date-Time',
      'Address',
      'Feedback',
      'Personal Information',
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
      FormScreen(),
      DateTimePickerScreen(),
      AddressForm(),
      FeedbackForm(),
      PersonalInformationForm(),
    ];
  }
}
