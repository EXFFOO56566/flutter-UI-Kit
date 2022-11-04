import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalSliderTooltipScreen extends StatefulWidget {
  @override
  _VerticalSliderTooltipScreenState createState() =>
      _VerticalSliderTooltipScreenState();
}

class _VerticalSliderTooltipScreenState
    extends State<VerticalSliderTooltipScreen> {
  DateTime _hourValue = DateTime(2020, 01, 01, 13, 00, 00);
  double _sliderValue = 20;

  SfSliderTheme _numerical() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
            showLabels: true,
            interval: 10,
            min: 10.0,
            max: 40.0,
            showTicks: true,
            tooltipPosition: SliderTooltipPosition.right,
            value: _sliderValue,
            onChanged: (dynamic values) {
              setState(() {
                _sliderValue = values as double;
              });
            },
            enableTooltip: true));
  }

  SfSliderTheme _dateTimeSlider() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
          min: DateTime(2020, 01, 01, 9, 00, 00),
          max: DateTime(2020, 01, 01, 21, 05, 00),
          showLabels: true,
          interval: 4,
          showTicks: true,
          minorTicksPerInterval: 3,
          dateFormat: DateFormat('h a'),
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
            return DateFormat('h:mm a').format(actualLabel);
          },
        ));
  }

  Widget _buildMobileLayout() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(children: <Widget>[
              Expanded(child: _numerical()),
              Text('Tooltip on the right')
            ]),
            Column(children: <Widget>[
              Expanded(child: _dateTimeSlider()),
              Text('Tooltip on the left'),
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
