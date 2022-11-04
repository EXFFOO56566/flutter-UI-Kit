/*
* File : Slider
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  double _starValue = 10;
  double _endValue = 80;

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
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Sliders", fontWeight: 600),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: FxText.titleMedium("Slider",
                  fontWeight: 600, letterSpacing: 0.2),
            ),
            Container(
              child: Slider(
                value: _sliderValue1,
                onChanged: (value) {
                  setState(() {
                    _sliderValue1 = value;
                  });
                },
                min: 0,
                max: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
              child: FxText.titleMedium("Labeled Slider",
                  fontWeight: 600, letterSpacing: 0.2),
            ),
            Container(
              child: Slider(
                value: _sliderValue2,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue2.floor().toString(),
                onChanged: (value) {
                  setState(
                    () {
                      _sliderValue2 = value;
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
              child: FxText.titleMedium("Range Slider",
                  fontWeight: 600, letterSpacing: 0.2),
            ),
            Container(
              child: RangeSlider(
                values: RangeValues(_starValue, _endValue),
                min: 0.0,
                max: 100.0,
                onChanged: (values) {
                  setState(() {
                    _starValue = values.start.roundToDouble();
                    _endValue = values.end.roundToDouble();
                  });
                },
                activeColor: theme.sliderTheme.activeTrackColor,
                inactiveColor: theme.sliderTheme.inactiveTrackColor,
              ),
            ),
          ],
        ));
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
