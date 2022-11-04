import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VerticalRangeSliderLabelScreen extends StatefulWidget {
  @override
  _VerticalRangeSliderLabelScreenState createState() =>
      _VerticalRangeSliderLabelScreenState();
}

class _VerticalRangeSliderLabelScreenState
    extends State<VerticalRangeSliderLabelScreen> {
  SfRangeValues _divisonSliderValues = const SfRangeValues(20.0, 80.0);
  SfRangeValues _tickSliderValues = const SfRangeValues(20.0, 80.0);
  SfRangeValues _labelSliderValues = const SfRangeValues(20.0, 80.0);

  SfRangeSlider _sliderWithDivider() {
    return SfRangeSlider.vertical(
        min: 0.0,
        max: 100.0,
        interval: 20,
        showDividers: true,
        values: _divisonSliderValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _divisonSliderValues = values;
          });
        });
  }

  SfRangeSlider _sliderWithTick() {
    return SfRangeSlider.vertical(
        min: 0.0,
        max: 100.0,
        interval: 20,
        showLabels: true,
        showTicks: true,
        minorTicksPerInterval: 1,
        labelPlacement: LabelPlacement.onTicks,
        values: _tickSliderValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _tickSliderValues = values;
          });
        });
  }

  SfRangeSlider _sliderWithLabel() {
    return SfRangeSlider.vertical(
        min: 0.0,
        max: 100.0,
        interval: 20,
        showLabels: true,
        values: _labelSliderValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _labelSliderValues = values;
          });
        });
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.height / 10.0;
    return Padding(
        padding: EdgeInsets.fromLTRB(0, padding, 0, padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: <Widget>[
              Expanded(child: _sliderWithDivider()),
              const Text('Dividers')
            ]),
            Column(children: <Widget>[
              Expanded(child: _sliderWithLabel()),
              const Text('Labels'),
            ]),
            Column(children: <Widget>[
              Expanded(child: _sliderWithTick()),
              const Text('Ticks'),
            ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileLayout();
  }
}
