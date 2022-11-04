/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderStepScreen extends StatefulWidget {
  @override
  _SliderStepScreenState createState() => _SliderStepScreenState();
}

class _SliderStepScreenState extends State<SliderStepScreen> {
  DateTime _yearValue = DateTime(2016, 1, 01);
  double _stepSliderValue = 0;

  SfSliderTheme _sliderWithStepDurationCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          min: DateTime(2010, 01, 01),
          max: DateTime(2020, 01, 01),
          showLabels: true,
          interval: 2,
          stepDuration: const SliderStepDuration(years: 2),
          dateFormat: DateFormat.y(),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.years,
          showTicks: true,
          value: _yearValue,
          onChanged: (dynamic values) {
            setState(() {
              _yearValue = values as DateTime;
            });
          },
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return DateFormat.y().format(actualLabel);
          },
        ));
  }

  SfSliderTheme _sliderWithStepCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
            showLabels: true,
            interval: 5,
            min: -10.0,
            max: 10.0,
            stepSize: 5,
            showTicks: true,
            value: _stepSliderValue,
            onChanged: (dynamic values) {
              setState(() {
                _stepSliderValue = values as double;
              });
            },
            enableTooltip: true));
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FxText.bodyMedium('Numeric'),
            FxSpacing.height(24),
            _sliderWithStepCustomization(),
            FxSpacing.height(24),
            FxText.bodyMedium('Date'),
            FxSpacing.height(24),
            _sliderWithStepDurationCustomization(),
            FxSpacing.height(24),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
