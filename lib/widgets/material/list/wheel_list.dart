/*
* File : List Wheel Scroll
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class WheelList extends StatefulWidget {
  @override
  _WheelListState createState() => _WheelListState();
}

class _WheelListState extends State<WheelList> {
  double _diameterRatio = 1;
  double _offAxisFraction = 0;
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
        body: Column(
      children: <Widget>[
        Container(
          padding: FxSpacing.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FxText.bodyLarge("Diameter Ratio", fontWeight: 600),
                  Slider(
                    value: _diameterRatio,
                    min: 0.1,
                    max: 2,
                    divisions: 19,
                    label: _diameterRatio.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(
                        () {
                          _diameterRatio = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  FxText.bodyLarge("Off Axis Fraction", fontWeight: 600),
                  Slider(
                    value: _offAxisFraction,
                    min: -2,
                    max: 2,
                    divisions: 40,
                    label: _offAxisFraction.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(
                        () {
                          _offAxisFraction = value;
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ListWheelScrollView(
            itemExtent: 60,
            physics: FixedExtentScrollPhysics(),
            diameterRatio: _diameterRatio,
            offAxisFraction: _offAxisFraction,
            children: <Widget>[
              ...List.generate(10, (index) => index + 1).map(
                (e) => Container(
                  padding: FxSpacing.all(16),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.face_outlined,
                          color: theme.colorScheme.onBackground),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: FxSpacing.left(8),
                          child: FxText.titleMedium("Item " + e.toString(),
                              color: theme.colorScheme.onBackground,
                              fontWeight: 400),
                        ),
                      ),
                      Icon(Icons.account_circle_outlined,
                          color: theme.colorScheme.onBackground),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
