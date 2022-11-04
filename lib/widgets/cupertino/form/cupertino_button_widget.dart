/*
* File : Cupertino Button
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CupertinoButtonWidget extends StatefulWidget {
  @override
  _CupertinoButtonWidgetState createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget> {
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
          title: FxText.titleMedium("Cupertino Buttons", fontWeight: 600),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.titleSmall("Flat Buttons",
                            color:
                                theme.colorScheme.onBackground.withAlpha(200),
                            letterSpacing: 0.2),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CupertinoButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  padding: EdgeInsets.only(
                                      left: 32, top: 8, right: 32, bottom: 8),
                                  pressedOpacity: 0.5,
                                  child: FxText.bodyMedium("Blue",
                                      color: theme.colorScheme.onSecondary)),
                              CupertinoButton(
                                  color: Colors.green,
                                  onPressed: () {},
                                  padding: EdgeInsets.only(
                                      left: 32, top: 8, right: 32, bottom: 8),
                                  child: FxText.bodyMedium("Green",
                                      color: theme.colorScheme.onSecondary)),
                              CupertinoButton(
                                  color: Colors.red,
                                  onPressed: () {},
                                  padding: EdgeInsets.only(
                                      left: 32, top: 8, right: 32, bottom: 8),
                                  child: FxText.bodyMedium("Red",
                                      color: theme.colorScheme.onSecondary)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
