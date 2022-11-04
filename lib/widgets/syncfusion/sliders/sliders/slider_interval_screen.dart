/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart' as intl;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderIntervalScreen extends StatefulWidget {
  @override
  _SliderIntervalScreenState createState() => _SliderIntervalScreenState();
}

class _SliderIntervalScreenState extends State<SliderIntervalScreen> {
  DateTime _yearValue = DateTime(2017, 01, 01);
  DateTime _hourValue = DateTime(2020, 01, 01, 13, 00, 00);

  SfSliderTheme _yearSlider() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          min: DateTime(2016, 01, 01),
          max: DateTime(2019, 01, 01),
          showLabels: true,
          interval: 1,
          dateFormat: intl.DateFormat.y(),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.years,
          showTicks: true,
          value: _yearValue,
          onChanged: (dynamic value) {
            setState(() {
              _yearValue = value as DateTime;
            });
          },
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return intl.DateFormat.yMMM().format(actualLabel);
          },
        ));
  }

  SfSliderTheme _hourSlider() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          min: DateTime(2020, 01, 01, 9, 00, 00),
          max: DateTime(2020, 01, 01, 21, 05, 00),
          showLabels: true,
          interval: 4,
          showTicks: true,
          minorTicksPerInterval: 3,
          dateFormat: intl.DateFormat('h a'),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.hours,
          value: _hourValue,
          onChanged: (dynamic value) {
            setState(() {
              _hourValue = value as DateTime;
            });
          },
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return intl.DateFormat('h:mm a').format(actualLabel);
          },
        ));
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FxText.bodyMedium('Interval as year'),
        FxSpacing.height(24),
        _yearSlider(),
        FxSpacing.height(36),
        FxText.bodyMedium('Interval as hour'),
        FxSpacing.height(24),
        _hourSlider(),
        FxSpacing.height(24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
