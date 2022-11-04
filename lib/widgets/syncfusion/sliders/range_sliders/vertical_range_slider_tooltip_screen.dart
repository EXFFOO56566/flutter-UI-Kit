import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalRangeSliderTooltipScreen extends StatefulWidget {
  @override
  _VerticalRangeSliderTooltipScreenState createState() =>
      _VerticalRangeSliderTooltipScreenState();
}

class _VerticalRangeSliderTooltipScreenState
    extends State<VerticalRangeSliderTooltipScreen> {
  SfRangeValues _values = const SfRangeValues(140.0, 160.0);
  SfRangeValues _hourValues = SfRangeValues(
      DateTime(2010, 01, 01, 13, 00, 00), DateTime(2010, 01, 01, 17, 00, 00));

  SfRangeSliderTheme _yearRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider.vertical(
          min: 100.0,
          max: 200.0,
          showLabels: true,
          interval: 20,
          showTicks: true,
          values: _values,
          tooltipPosition: SliderTooltipPosition.right,
          onChanged: (SfRangeValues values) {
            setState(() {
              _values = values;
            });
          },
          enableTooltip: true,
        ));
  }

  SfRangeSliderTheme _hourRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider.vertical(
          min: DateTime(2010, 01, 01, 9, 00, 00),
          max: DateTime(2010, 01, 01, 21, 05, 00),
          showLabels: true,
          interval: 4,
          showTicks: true,
          minorTicksPerInterval: 3,
          dateFormat: DateFormat('h a'),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.hours,
          values: _hourValues,
          onChanged: (SfRangeValues values) {
            setState(() {
              _hourValues = values;
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
              Expanded(child: _yearRangeSlider()),
              const Text('Tooltip on the right')
            ]),
            Column(children: <Widget>[
              Expanded(child: _hourRangeSlider()),
              const Text('Tooltip on the left'),
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
