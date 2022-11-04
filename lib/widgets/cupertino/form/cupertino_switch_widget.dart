/*
* File : Cupertino Switch
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  @override
  _CupertinoSwitchWidgetState createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _switch1 = true, _switch2 = true, _switch3 = false;

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
          title: FxText.titleMedium("Switch", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  MergeSemantics(
                    child: ListTile(
                      title: FxText.bodyLarge('Simple', fontWeight: 600),
                      trailing: CupertinoSwitch(
                        value: _switch1,
                        onChanged: (bool value) {
                          setState(() {
                            _switch1 = value;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _switch1 = !_switch1;
                        });
                      },
                    ),
                  ),
                  MergeSemantics(
                    child: ListTile(
                      title: FxText.bodyLarge('Thumb Color', fontWeight: 600),
                      trailing: CupertinoSwitch(
                        activeColor: theme.colorScheme.primary,
                        value: _switch2,
                        onChanged: (bool value) {
                          setState(() {
                            _switch2 = value;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _switch2 = !_switch2;
                        });
                      },
                    ),
                  ),
                  MergeSemantics(
                    child: ListTile(
                      title: FxText.bodyLarge('Track Color', fontWeight: 600),
                      trailing: CupertinoSwitch(
                        activeColor: theme.colorScheme.primary,
                        trackColor: theme.colorScheme.secondary,
                        value: _switch3,
                        onChanged: (bool value) {
                          setState(() {
                            _switch3 = value;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _switch3 = !_switch3;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
