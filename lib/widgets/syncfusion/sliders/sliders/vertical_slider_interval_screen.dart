import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalSliderIntervalScreen extends StatefulWidget {
  @override
  _VerticalSliderIntervalScreenState createState() =>
      _VerticalSliderIntervalScreenState();
}

class _VerticalSliderIntervalScreenState
    extends State<VerticalSliderIntervalScreen> {
  DateTime _yearValue = DateTime(2018, 01, 01);
  DateTime _hourValue = DateTime(2020, 01, 01, 13, 00, 00);

  SfSliderTheme _yearSlider() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider.vertical(
          min: DateTime(2016, 01, 01),
          max: DateTime(2020, 01, 01),
          showLabels: true,
          interval: 1,
          dateFormat: DateFormat.y(),
          labelPlacement: LabelPlacement.betweenTicks,
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
            return DateFormat.yMMM().format(actualLabel);
          },
        ));
  }

  SfSliderTheme _hourSlider() {
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
    final double padding = MediaQuery.of(context).size.height / 10.0;
    return Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(children: <Widget>[
              Expanded(
                flex: 4,
                child: _yearSlider(),
              ),
              Text('Interval as year')
            ]),
            Column(children: <Widget>[
              Expanded(
                flex: 4,
                child: _hourSlider(),
              ),
              Text('Interval as hour'),
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
