import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialGradientChart extends StatefulWidget {
  RadialGradientChart({Key? key}) : super(key: key);

  @override
  _RadialGradientChartState createState() => _RadialGradientChartState();
}

class _RadialGradientChartState extends State<RadialGradientChart> {
  late TooltipBehavior _tooltipBehavior;

  late List<Color> colors;

  late List<double> stops;

  @override
  void initState() {
    colors = const <Color>[
      Colors.red,
      Colors.yellow,
      Colors.green,
    ];
    stops = <double>[0.3, 0.6, 0.9];
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.ym');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildDefaultRadialBarChart()));
  }

  SfCircularChart _buildDefaultRadialBarChart() {
    return SfCircularChart(
        key: GlobalKey(),
        onCreateShader: (ChartShaderDetails chartShaderDetails) {
          return ui.Gradient.sweep(
              chartShaderDetails.outerRect.center,
              colors,
              stops,
              TileMode.clamp,
              _degreeToRadian(0),
              _degreeToRadian(360),
              _resolveTransform(
                  chartShaderDetails.outerRect, TextDirection.ltr));
        },
        legend: Legend(
            isVisible: true,
            iconHeight: 20,
            iconWidth: 20,
            position: LegendPosition.bottom,
            textStyle: const TextStyle(fontSize: 15)),
        title: ChartTitle(
            text: 'Shot put distance', textStyle: FxTextStyle.bodySmall()),
        series: _getRadialBarGradientSeries(),
        tooltipBehavior: _tooltipBehavior);
  }

  List<RadialBarSeries<_ChartShaderData, String>>
      _getRadialBarGradientSeries() {
    final List<_ChartShaderData> chartData = <_ChartShaderData>[
      _ChartShaderData('John', 10, '100%'),
      _ChartShaderData('Almaida', 11, '100%'),
      _ChartShaderData('Don', 12, '100%'),
    ];
    return <RadialBarSeries<_ChartShaderData, String>>[
      RadialBarSeries<_ChartShaderData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          gap: '10%',
          radius: '90%',
          xValueMapper: (_ChartShaderData data, _) => data.x,
          yValueMapper: (_ChartShaderData data, _) => data.y,
          pointRadiusMapper: (_ChartShaderData data, _) => data.text,
          dataLabelMapper: (_ChartShaderData data, _) => data.x)
    ];
  }

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);
}

class _ChartShaderData {
  _ChartShaderData(this.x, this.y, this.text);

  final String x;

  final num y;

  final String text;
}
