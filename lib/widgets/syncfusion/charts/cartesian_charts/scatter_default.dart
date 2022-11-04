import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class ScatterDefault extends StatefulWidget {
  ScatterDefault({Key? key}) : super(key: key);

  @override
  _ScatterDefaultState createState() => _ScatterDefaultState();
}

class _ScatterDefaultState extends State<ScatterDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildDefaultScatterChart()),
    );
  }

  SfCartesianChart _buildDefaultScatterChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Export growth rate\n', textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      primaryXAxis: DateTimeAxis(
        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}%',
        axisLine: const AxisLine(width: 0),
        majorTickLines:
            const MajorTickLines(size: 8, color: Colors.transparent),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getDefaultScatterSeries(),
    );
  }

  /// Returns the list of chart series
  /// which need to render on the scatter chart.
  List<ScatterSeries<ChartSampleData, DateTime>> _getDefaultScatterSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2006, 1, 1),
          y: 0.01,
          yValue: -0.03,
          secondSeriesYValue: 0.10),
      ChartSampleData(
          x: DateTime(2007, 1, 1),
          y: 0.03,
          yValue: -0.02,
          secondSeriesYValue: 0.08),
      ChartSampleData(
          x: DateTime(2008, 1, 1),
          y: -0.06,
          yValue: -0.13,
          secondSeriesYValue: -0.03),
      ChartSampleData(
          x: DateTime(2009, 1, 1),
          y: -0.03,
          yValue: -0.04,
          secondSeriesYValue: 0.04),
      ChartSampleData(
          x: DateTime(2010, 1, 1),
          y: 0.09,
          yValue: 0.07,
          secondSeriesYValue: 0.19),
      ChartSampleData(
          x: DateTime(2011, 1, 1), y: 0, yValue: 0.04, secondSeriesYValue: 0),
      ChartSampleData(
          x: DateTime(2012, 1, 1),
          y: 0.01,
          yValue: -0.01,
          secondSeriesYValue: -0.09),
      ChartSampleData(
          x: DateTime(2013, 1, 1),
          y: 0.05,
          yValue: 0.05,
          secondSeriesYValue: 0.10),
      ChartSampleData(
          x: DateTime(2014, 1, 1),
          y: 0,
          yValue: 0.08,
          secondSeriesYValue: 0.05),
      ChartSampleData(
          x: DateTime(2015, 1, 1),
          y: 0.1,
          yValue: 0.01,
          secondSeriesYValue: -0.04),
      ChartSampleData(
          x: DateTime(2016, 1, 1),
          y: 0.08,
          yValue: 0,
          secondSeriesYValue: 0.02),
    ];
    return <ScatterSeries<ChartSampleData, DateTime>>[
      ScatterSeries<ChartSampleData, DateTime>(
          dataSource: chartData,
          opacity: 0.7,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          markerSettings: const MarkerSettings(height: 15, width: 15),
          name: 'Brazil'),
      ScatterSeries<ChartSampleData, DateTime>(
          opacity: 0.7,
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
          yValueMapper: (ChartSampleData sales, _) => sales.yValue,
          markerSettings: const MarkerSettings(height: 15, width: 15),
          name: 'Canada'),
      ScatterSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        color: const Color.fromRGBO(0, 168, 181, 1),
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
        name: 'India',
        markerSettings: const MarkerSettings(height: 15, width: 15),
      )
    ];
  }
}
