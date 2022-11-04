import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class DoughnutDefault extends StatefulWidget {
  DoughnutDefault({Key? key}) : super(key: key);

  @override
  _DoughnutDefaultState createState() => _DoughnutDefaultState();
}

class _DoughnutDefaultState extends State<DoughnutDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildDefaultDoughnutChart()));
  }

  SfCircularChart _buildDefaultDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Composition of ocean water',
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: _getDefaultDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getDefaultDoughnutSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Chlorine', y: 55, text: '55%'),
      ChartSampleData(x: 'Sodium', y: 31, text: '31%'),
      ChartSampleData(x: 'Magnesium', y: 7.7, text: '7.7%'),
      ChartSampleData(x: 'Sulfur', y: 3.7, text: '3.7%'),
      ChartSampleData(x: 'Calcium', y: 1.2, text: '1.2%'),
      ChartSampleData(x: 'Others', y: 1.4, text: '1.4%'),
    ];
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          radius: '80%',
          explode: true,
          explodeOffset: '10%',
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }
}
