import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class BarDefault extends StatefulWidget {
  BarDefault({Key? key}) : super(key: key);

  @override
  _BarDefaultState createState() => _BarDefaultState();
}

class _BarDefaultState extends State<BarDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildDefaultBarChart()),
    );
  }

  SfCartesianChart _buildDefaultBarChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Tourism - Number of arrivals\n',
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      series: _getDefaultBarSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<BarSeries<ChartSampleData, String>> _getDefaultBarSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'France',
          y: 84452000,
          secondSeriesYValue: 82682000,
          thirdSeriesYValue: 86861000),
      ChartSampleData(
          x: 'Spain',
          y: 68175000,
          secondSeriesYValue: 75315000,
          thirdSeriesYValue: 81786000),
      ChartSampleData(
          x: 'US',
          y: 77774000,
          secondSeriesYValue: 76407000,
          thirdSeriesYValue: 76941000),
      ChartSampleData(
          x: 'Italy',
          y: 50732000,
          secondSeriesYValue: 52372000,
          thirdSeriesYValue: 58253000),
      ChartSampleData(
          x: 'Mexico',
          y: 32093000,
          secondSeriesYValue: 35079000,
          thirdSeriesYValue: 39291000),
      ChartSampleData(
          x: 'UK',
          y: 34436000,
          secondSeriesYValue: 35814000,
          thirdSeriesYValue: 37651000),
    ];
    return <BarSeries<ChartSampleData, String>>[
      BarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: '2015'),
      BarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: '2016'),
      BarSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: '2017')
    ];
  }
}
