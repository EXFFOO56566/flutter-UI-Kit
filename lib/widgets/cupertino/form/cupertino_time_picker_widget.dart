/*
* File : Cupertino Time Picker
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CupertinoTimePickerWidget extends StatefulWidget {
  @override
  _CupertinoTimePickerWidgetState createState() =>
      _CupertinoTimePickerWidgetState();
}

class _CupertinoTimePickerWidgetState extends State<CupertinoTimePickerWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Time Picker", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Container(
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (dateTime) {}),
            )));
  }
}
