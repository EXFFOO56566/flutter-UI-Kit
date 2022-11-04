import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class PieGradient extends StatefulWidget {
  PieGradient({Key? key}) : super(key: key);

  @override
  _PieGradientState createState() => _PieGradientState();
}

class _PieGradientState extends State<PieGradient> {
  late List<Color> colors;

  late List<double> stops;
  late String _shaderType;

  @override
  void initState() {
    _initializeVariables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildDefaultPieChart()));
  }

  void _initializeVariables() {
    colors = const <Color>[
      Color.fromRGBO(96, 87, 234, 1),
      Color.fromRGBO(59, 141, 236, 1),
      Color.fromRGBO(112, 198, 129, 1),
      Color.fromRGBO(237, 241, 81, 1)
    ];
    stops = <double>[0.25, 0.5, 0.75, 1];
    _shaderType = 'sweep';
  }

  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        if (_shaderType == 'linear') {
          return ui.Gradient.linear(chartShaderDetails.outerRect.topRight,
              chartShaderDetails.outerRect.centerLeft, colors, stops);
        } else if (_shaderType == 'radial') {
          return ui.Gradient.radial(
              chartShaderDetails.outerRect.center,
              chartShaderDetails.outerRect.right -
                  chartShaderDetails.outerRect.center.dx,
              colors,
              stops);
        } else {
          return ui.Gradient.sweep(
              chartShaderDetails.outerRect.center,
              colors,
              stops,
              TileMode.clamp,
              _degreeToRadian(0),
              _degreeToRadian(360),
              _resolveTransform(
                  chartShaderDetails.outerRect, TextDirection.ltr));
        }
      },
      title: ChartTitle(
          text: 'Sales by sales person', textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'David', y: 17, text: 'David \n 17%'),
      ChartSampleData(x: 'Steve', y: 20, text: 'Steve \n 20%'),
      ChartSampleData(x: 'Jack', y: 25, text: 'Jack \n 25%'),
      ChartSampleData(x: 'Others', y: 38, text: 'Others \n 38%')
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: pieData,
          explodeAll: true,
          explodeOffset: '3%',
          explode: true,
          strokeColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
          strokeWidth: 1.5,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            textStyle: TextStyle(fontSize: 13, color: Colors.white),
          ),
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text),
    ];
  }

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  void onShaderTyeChange(String item) {
    _shaderType = item;
    setState(() {
      if (_shaderType == 'linear') {
        _shaderType = 'linear';
      }

      if (_shaderType == 'radial') {
        _shaderType = 'radial';
      }
      if (_shaderType == 'sweep') {
        _shaderType = 'sweep';
      }
    });
  }

  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);
}
