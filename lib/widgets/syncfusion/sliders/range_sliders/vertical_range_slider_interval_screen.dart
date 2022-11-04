import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalRangeSliderIntervalScreen extends StatefulWidget {
  @override
  _VerticalRangeSliderIntervalScreenState createState() =>
      _VerticalRangeSliderIntervalScreenState();
}

class _VerticalRangeSliderIntervalScreenState
    extends State<VerticalRangeSliderIntervalScreen> {
  SfRangeValues _yearValues =
      SfRangeValues(DateTime(2012, 1, 01), DateTime(2018, 1, 1));
  SfRangeValues _values = const SfRangeValues(20.0, 80.0);

  SfRangeSliderTheme _yearRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider.vertical(
          min: DateTime(2010, 01, 01),
          max: DateTime(2020, 01, 01),
          interval: 2,
          showLabels: true,
          stepDuration: const SliderStepDuration(years: 2),
          dateFormat: DateFormat.y(),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.years,
          enableIntervalSelection: true,
          showTicks: true,
          values: _yearValues,
          onChanged: (SfRangeValues values) {
            setState(() {
              _yearValues = values;
            });
          },
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return DateFormat.yMMM().format(actualLabel);
          },
        ));
  }

  SfRangeSliderTheme _numericRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider.vertical(
            showLabels: true,
            interval: 20,
            min: 0.0,
            max: 100.0,
            stepSize: 20,
            showTicks: true,
            enableIntervalSelection: true,
            values: _values,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
              });
            },
            enableTooltip: true));
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.height / 10.0;
    return Padding(
        padding: EdgeInsets.fromLTRB(padding, padding, padding, padding / 2),
        child: Column(children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: padding / 2),
                    child: Column(children: <Widget>[
                      Expanded(child: _numericRangeSlider()),
                      const Text('Numeric')
                    ])),
                Padding(
                    padding: EdgeInsets.only(bottom: padding / 2),
                    child: Column(children: <Widget>[
                      Expanded(child: _yearRangeSlider()),
                      const Text('DateTime'),
                    ])),
              ],
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
