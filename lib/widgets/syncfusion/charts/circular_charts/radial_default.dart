import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class RadialDefault extends StatefulWidget {
  RadialDefault({Key? key}) : super(key: key);

  @override
  _RadialDefaultState createState() => _RadialDefaultState();
}

class _RadialDefaultState extends State<RadialDefault> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
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
      title: ChartTitle(
          text: 'Shot put distance', textStyle: FxTextStyle.bodySmall()),
      series: _getRadialBarDefaultSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'John',
          y: 10,
          text: '100%',
          pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
      ChartSampleData(
          x: 'Almaida',
          y: 11,
          text: '100%',
          pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
      ChartSampleData(
          x: 'Don',
          y: 12,
          text: '100%',
          pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
      ChartSampleData(
          x: 'Tom',
          y: 13,
          text: '100%',
          pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
    ];
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          gap: '10%',
          radius: '90%',
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointRadiusMapper: (ChartSampleData data, _) => data.text,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String)
    ];
  }
}
