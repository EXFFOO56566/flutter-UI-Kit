/*
* File : Cupertino Timer
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CupertinoTimerPickerWidget extends StatefulWidget {
  @override
  _CupertinoTimerPickerWidgetState createState() =>
      _CupertinoTimerPickerWidgetState();
}

class _CupertinoTimerPickerWidgetState
    extends State<CupertinoTimerPickerWidget> {
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
          title: FxText.titleMedium("Timer", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Container(
              child: CupertinoTimerPicker(
                onTimerDurationChanged: (Duration value) {},
                mode: CupertinoTimerPickerMode.hms,
              ),
            )));
  }
}
