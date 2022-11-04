/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalSliderLabelScreen extends StatefulWidget {
  @override
  _VerticalSliderLabelScreenState createState() =>
      _VerticalSliderLabelScreenState();
}

class _VerticalSliderLabelScreenState extends State<VerticalSliderLabelScreen> {
  double _labelSliderValue = 50;
  double _tickSliderValue = 0;
  double _dividerSliderValue = 50;

  SfSliderTheme _sliderWithLabelCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
          showLabels: true,
          interval: 20,
          min: 10.0,
          max: 90.0,
          value: _labelSliderValue,
          onChanged: (dynamic values) {
            setState(() {
              _labelSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }

  SfSliderTheme _sliderWithTickCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
          showLabels: true,
          showTicks: true,
          interval: 25,
          min: -50.0,
          max: 50.0,
          value: _tickSliderValue,
          onChanged: (dynamic values) {
            setState(() {
              _tickSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }

  SfSliderTheme _sliderWithDividerCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
          interval: 25,
          showDividers: true,
          min: 0.0,
          max: 100.0,
          value: _dividerSliderValue,
          tooltipPosition: SliderTooltipPosition.right,
          onChanged: (dynamic values) {
            setState(() {
              _dividerSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.height / 10.0;
    return Padding(
        padding: EdgeInsets.fromLTRB(0, padding, 0, padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: <Widget>[
              Expanded(child: _sliderWithDividerCustomization()),
              Text('Dividers')
            ]),
            Column(children: <Widget>[
              Expanded(child: _sliderWithLabelCustomization()),
              Text('Labels'),
            ]),
            Column(children: <Widget>[
              Expanded(child: _sliderWithTickCustomization()),
              Text('Ticks')
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
