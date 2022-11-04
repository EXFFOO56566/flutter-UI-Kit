import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderIntervalScreen extends StatefulWidget {
  @override
  _RangeSliderIntervalScreenState createState() =>
      _RangeSliderIntervalScreenState();
}

class _RangeSliderIntervalScreenState extends State<RangeSliderIntervalScreen> {
  SfRangeValues _yearValues =
      SfRangeValues(DateTime(2012, 1, 01), DateTime(2018, 1, 1));
  SfRangeValues _values = SfRangeValues(20.0, 80.0);

  SfRangeSliderTheme _yearRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider(
          min: DateTime(2010, 01, 01),
          max: DateTime(2020, 01, 01),
          interval: 2,
          showLabels: true,
          stepDuration: SliderStepDuration(years: 2),
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
        child: SfRangeSlider(
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
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FxText.bodyMedium('Numeric'),
            FxSpacing.height(24),
            _numericRangeSlider(),
            FxSpacing.height(24),
            FxText.bodyMedium('Date'),
            FxSpacing.height(24),
            _yearRangeSlider(),
            FxSpacing.height(24),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
