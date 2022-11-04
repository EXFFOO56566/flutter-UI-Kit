/*
* File : Cupertino Date & Time Picker
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoDateTimePickerScreen extends StatefulWidget {
  @override
  _CupertinoDateTimePickerScreenState createState() =>
      _CupertinoDateTimePickerScreenState();
}

class _CupertinoDateTimePickerScreenState
    extends State<CupertinoDateTimePickerScreen> {
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
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (dateTime) {}));
  }
}
