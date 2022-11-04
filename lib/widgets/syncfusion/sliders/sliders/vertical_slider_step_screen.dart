/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalSliderStepScreen extends StatefulWidget {
  @override
  _VerticalSliderStepScreenState createState() =>
      _VerticalSliderStepScreenState();
}

class _VerticalSliderStepScreenState extends State<VerticalSliderStepScreen> {
  DateTime _yearValue = DateTime(2016, 1, 01);
  double _stepSliderValue = 0;

  SfSliderTheme _sliderWithStepDurationCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
          min: DateTime(2010, 01, 01),
          max: DateTime(2020, 01, 01),
          showLabels: true,
          interval: 2,
          stepDuration: SliderStepDuration(years: 2),
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
        child: SfSlider.vertical(
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
    final double padding = MediaQuery.of(context).size.height / 10.0;
    return Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(children: <Widget>[
              Expanded(child: _sliderWithStepCustomization()),
              Text('Numeric')
            ]),
            Column(children: <Widget>[
              Expanded(child: _sliderWithStepDurationCustomization()),
              Text('DateTime')
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
