/*
* File : Simple Dialog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class SimpleDialogScreen extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleDialogScreen> {
  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _SimpleDialog());
  }

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
            body: Center(
          child: FxButton(
              onPressed: () {
                _showDialog();
              },
              elevation: 0,
              borderRadiusAll: 4,
              child: FxText.bodyMedium("Simple Dialog",
                  color: theme.colorScheme.onPrimary, letterSpacing: 0.2)),
        )));
  }
}

class _SimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(16),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FxText.titleLarge(
              "Title",
              fontWeight: 700,
            ),
            FxText.titleMedium(
              "Description...",
              fontWeight: 500,
            ),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                child: FxButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderRadiusAll: 4,
                    elevation: 0,
                    child: FxText.bodyMedium("OK",
                        letterSpacing: 0.3,
                        color: themeData.colorScheme.onPrimary))),
          ],
        ),
      ),
    );
  }
}
