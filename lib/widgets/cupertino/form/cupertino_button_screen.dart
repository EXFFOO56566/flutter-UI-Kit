/*
* File : Cupertino Button
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoButtonScreen extends StatefulWidget {
  @override
  _CupertinoButtonScreenState createState() => _CupertinoButtonScreenState();
}

class _CupertinoButtonScreenState extends State<CupertinoButtonScreen> {
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
        body: Container(
            padding: FxSpacing.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Padding(
                padding: FxSpacing.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleSmall("Flat Buttons",
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        fontWeight: 600,
                        letterSpacing: 0.2),
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CupertinoButton(
                            color: Colors.blue,
                            onPressed: () {},
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            padding: FxSpacing.xy(32, 8),
                            pressedOpacity: 0.5,
                            child: FxText.bodyMedium("Blue",
                                color: theme.colorScheme.onSecondary)),
                        CupertinoButton(
                            color: Colors.green,
                            onPressed: () {},
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            padding: FxSpacing.xy(32, 8),
                            child: FxText.bodyMedium("Green",
                                color: theme.colorScheme.onSecondary)),
                        CupertinoButton(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onPressed: () {},
                            padding: FxSpacing.xy(32, 8),
                            child: FxText.bodyMedium("Red",
                                color: theme.colorScheme.onSecondary)),
                      ],
                    ),
                    FxSpacing.height(20),
                    FxText.titleSmall("With Radius",
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        fontWeight: 600,
                        letterSpacing: 0.2),
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CupertinoButton(
                            color: Colors.blue,
                            onPressed: () {},
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            padding: FxSpacing.xy(32, 8),
                            pressedOpacity: 0.5,
                            child: FxText.bodyMedium("Blue",
                                color: theme.colorScheme.onSecondary)),
                        CupertinoButton(
                            color: Colors.green,
                            onPressed: () {},
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            padding: FxSpacing.xy(32, 8),
                            child: FxText.bodyMedium("Green",
                                color: theme.colorScheme.onSecondary)),
                        CupertinoButton(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            onPressed: () {},
                            padding: FxSpacing.xy(32, 8),
                            child: FxText.bodyMedium("Red",
                                color: theme.colorScheme.onSecondary)),
                      ],
                    ),
                    FxSpacing.height(20),
                    FxText.titleSmall("Rounded",
                        color: theme.colorScheme.onBackground.withAlpha(200),
                        fontWeight: 600,
                        letterSpacing: 0.2),
                    FxSpacing.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CupertinoButton(
                            color: Colors.blue,
                            onPressed: () {},
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            padding: FxSpacing.xy(32, 8),
                            pressedOpacity: 0.5,
                            child: FxText.bodyMedium("Blue",
                                color: theme.colorScheme.onSecondary)),
                        CupertinoButton(
                            color: Colors.green,
                            onPressed: () {},
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            padding: FxSpacing.xy(32, 8),
                            child: FxText.bodyMedium("Green",
                                color: theme.colorScheme.onSecondary)),
                        CupertinoButton(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            onPressed: () {},
                            padding: FxSpacing.xy(32, 8),
                            child: FxText.bodyMedium("Red",
                                color: theme.colorScheme.onSecondary)),
                      ],
                    ),
                  ],
                ),
              )
            ])));
  }
}
