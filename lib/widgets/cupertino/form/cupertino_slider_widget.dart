/*
* File : Cupertino Slider
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CupertinoSliderWidget extends StatefulWidget {
  @override
  _CupertinoSliderWidgetState createState() => _CupertinoSliderWidgetState();
}

class _CupertinoSliderWidgetState extends State<CupertinoSliderWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  double _progress = 60, _progress2 = 40, _progress3 = 80;

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
          title: FxText.titleMedium("Cupertino Slider", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
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
                    padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
                    child:
                        FxText.titleSmall("Divisions Slider", fontWeight: 600),
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
                    padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
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
            )));
  }
}
