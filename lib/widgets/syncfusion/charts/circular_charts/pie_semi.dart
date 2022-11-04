import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class PieSemi extends StatefulWidget {
  PieSemi({Key? key}) : super(key: key);

  @override
  _PieSemiState createState() => _PieSemiState();
}

class _PieSemiState extends State<PieSemi> {
  int _startAngle = 270;
  int _endAngle = 90;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, format: 'point.x : point.y%');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildSemiPieChartChart()));
  }

  SfCircularChart _buildSemiPieChartChart() {
    return SfCircularChart(
      centerY: '60%',
      title: ChartTitle(
          text: 'Rural population of various countries',
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: _getSemiPieChartSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<PieSeries<ChartSampleData, String>> _getSemiPieChartSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Algeria', y: 28),
      ChartSampleData(x: 'Australia', y: 14),
      ChartSampleData(x: 'Bolivia', y: 31),
      ChartSampleData(x: 'Cambodia', y: 77),
      ChartSampleData(x: 'Canada', y: 19),
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.x as String,
          startAngle: _startAngle,
          endAngle: _endAngle,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.inside))
    ];
  }
}
