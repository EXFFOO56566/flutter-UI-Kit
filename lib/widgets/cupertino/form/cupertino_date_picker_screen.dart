/*
* File : Cupertino Date Picker
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoDatePickerScreen extends StatefulWidget {
  @override
  _CupertinoDatePickerScreenState createState() =>
      _CupertinoDatePickerScreenState();
}

class _CupertinoDatePickerScreenState extends State<CupertinoDatePickerScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {}));
  }
}
