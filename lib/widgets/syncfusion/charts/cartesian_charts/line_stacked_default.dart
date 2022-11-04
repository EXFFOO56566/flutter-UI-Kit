import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class LineStackedDefault extends StatefulWidget {
  LineStackedDefault({Key? key}) : super(key: key);

  @override
  _LineStackedDefaultState createState() => _LineStackedDefaultState();
}

class _LineStackedDefaultState extends State<LineStackedDefault> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildStackedLineChart()),
    );
  }

  SfCartesianChart _buildStackedLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Monthly expense of a family\n',
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        labelRotation: 0,
      ),
      primaryYAxis: NumericAxis(
          maximum: 200,
          axisLine: AxisLine(width: 0),
          labelFormat: r'${value}',
          majorTickLines: MajorTickLines(size: 12, color: Colors.transparent)),
      series: _getStackedLineSeries(),
      trackballBehavior: _trackballBehavior,
    );
  }

  List<StackedLineSeries<ChartSampleData, String>> _getStackedLineSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Food',
          y: 55,
          yValue: 40,
          secondSeriesYValue: 45,
          thirdSeriesYValue: 48),
      ChartSampleData(
          x: 'Transport',
          y: 33,
          yValue: 45,
          secondSeriesYValue: 54,
          thirdSeriesYValue: 28),
      ChartSampleData(
          x: 'Medical',
          y: 43,
          yValue: 23,
          secondSeriesYValue: 20,
          thirdSeriesYValue: 34),
      ChartSampleData(
          x: 'Clothes',
          y: 32,
          yValue: 54,
          secondSeriesYValue: 23,
          thirdSeriesYValue: 54),
      ChartSampleData(
          x: 'Books',
          y: 56,
          yValue: 18,
          secondSeriesYValue: 43,
          thirdSeriesYValue: 55),
      ChartSampleData(
          x: 'Others',
          y: 23,
          yValue: 54,
          secondSeriesYValue: 33,
          thirdSeriesYValue: 56),
    ];
    return <StackedLineSeries<ChartSampleData, String>>[
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Father',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          name: 'Mother',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Son',
          markerSettings: MarkerSettings(isVisible: true)),
      StackedLineSeries<ChartSampleData, String>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
          name: 'Daughter',
          markerSettings: MarkerSettings(isVisible: true))
    ];
  }
}
