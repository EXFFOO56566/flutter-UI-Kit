/*
* File : Cupertino Switch
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoSwitchScreen extends StatefulWidget {
  @override
  _CupertinoSwitchScreenState createState() => _CupertinoSwitchScreenState();
}

class _CupertinoSwitchScreenState extends State<CupertinoSwitchScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  bool _switch1 = true, _switch2 = true, _switch3 = false;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    ));
  }
}
