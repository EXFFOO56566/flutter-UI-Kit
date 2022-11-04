import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderTooltipScreen extends StatefulWidget {
  @override
  _RangeSliderTooltipScreenState createState() =>
      _RangeSliderTooltipScreenState();
}

class _RangeSliderTooltipScreenState extends State<RangeSliderTooltipScreen> {
  SfRangeValues _yearValues =
      SfRangeValues(DateTime(2002, 4, 01), DateTime(2003, 10, 01));
  SfRangeValues _hourValues = SfRangeValues(
      DateTime(2010, 01, 01, 13, 00, 00), DateTime(2010, 01, 01, 17, 00, 00));

  SfRangeSliderTheme _yearRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider(
          min: DateTime(2001, 01, 01),
          max: DateTime(2005, 01, 01),
          showLabels: true,
          interval: 1,
          dateFormat: DateFormat.y(),
          labelPlacement: LabelPlacement.onTicks,
          dateIntervalType: DateIntervalType.years,
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

  SfRangeSliderTheme _hourRangeSlider() {
    return SfRangeSliderTheme(
        data: SfRangeSliderThemeData(),
        child: SfRangeSlider(
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
          tooltipShape: const SfPaddleTooltipShape(),
          tooltipTextFormatterCallback:
              (dynamic actualLabel, String formattedText) {
            return DateFormat('h:mm a').format(actualLabel);
          },
        ));
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FxText.bodyMedium('Rectangular'),
            FxSpacing.height(24),
            _yearRangeSlider(),
            FxSpacing.height(24),
            FxText.bodyMedium('Paddle'),
            FxSpacing.height(24),
            _hourRangeSlider(),
            FxSpacing.height(24),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
