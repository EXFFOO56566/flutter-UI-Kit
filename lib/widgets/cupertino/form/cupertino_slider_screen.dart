/*
* File : Cupertino Slider
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoSliderScreen extends StatefulWidget {
  @override
  _CupertinoSliderScreenState createState() => _CupertinoSliderScreenState();
}

class _CupertinoSliderScreenState extends State<CupertinoSliderScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  double _progress = 60, _progress2 = 40, _progress3 = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: FxSpacing.fromLTRB(16, 16, 0, 16),
            child: FxText.titleSmall("Simple Slider", fontWeight: 600),
          ),
          Container(
            child: CupertinoSlider(
              value: _progress,
              min: 0.0,
              max: 100.0,
              activeColor: theme.colorScheme.secondary,
              onChanged: (value) {
                setState(() {
                  _progress = value.roundToDouble();
                });
              },
            ),
          ),
          Container(
            padding: FxSpacing.fromLTRB(16, 16, 0, 16),
            child: FxText.titleSmall("Divisions Slider", fontWeight: 600),
          ),
          Container(
            child: CupertinoSlider(
              value: _progress2,
              min: 0.0,
              max: 100.0,
              activeColor: theme.colorScheme.secondary,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _progress2 = value.roundToDouble();
                });
              },
            ),
          ),
          Container(
            padding: FxSpacing.fromLTRB(16, 16, 0, 16),
            child: FxText.titleSmall("Thumb Color", fontWeight: 600),
          ),
          Container(
            child: CupertinoSlider(
              value: _progress3,
              min: 0.0,
              max: 100.0,
              activeColor: theme.colorScheme.primary,
              thumbColor: theme.colorScheme.primary,
              onChanged: (value) {
                setState(() {
                  _progress3 = value.roundToDouble();
                });
              },
            ),
          ),
        ],
      ),
    ));
  }
}
