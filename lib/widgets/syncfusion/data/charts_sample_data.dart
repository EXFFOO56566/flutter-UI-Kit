import 'package:flutter/material.dart';

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}
