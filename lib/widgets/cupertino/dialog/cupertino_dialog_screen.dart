/*
* File : Cupertino Dialog
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoDialogScreen extends StatefulWidget {
  @override
  _CupertinoDialogScreenState createState() => _CupertinoDialogScreenState();
}

class _CupertinoDialogScreenState extends State<CupertinoDialogScreen> {
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
        body: Center(
      child: CupertinoButton(
          color: theme.colorScheme.primary,
          onPressed: () {
            _showDialog();
          },
          borderRadius: BorderRadius.all(Radius.circular(4)),
          padding: FxSpacing.xy(32, 8),
          pressedOpacity: 0.5,
          child: FxText.bodyMedium("Show", color: theme.colorScheme.onPrimary)),
    ));
  }

  _showDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: FxText.titleMedium('Cupertino Simple Dialog', fontWeight: 600),
          content: Container(
            margin: FxSpacing.top(16),
            child: FxText.bodyLarge(
                'Lorem ipsum is a pseudo-Latin text used in web design, ',
                fontWeight: 400),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: FxText.titleMedium('OK',
                  color: theme.colorScheme.primary,
                  fontWeight: 700,
                  letterSpacing: 0.3),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
