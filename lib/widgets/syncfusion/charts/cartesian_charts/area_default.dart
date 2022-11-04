import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class AreaDefault extends StatefulWidget {
  AreaDefault({Key? key}) : super(key: key);

  @override
  _AreaDefaultState createState() => _AreaDefaultState();
}

class _AreaDefaultState extends State<AreaDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildDefaultAreaChart()),
    );
  }

  SfCartesianChart _buildDefaultAreaChart() {
    return SfCartesianChart(
      legend: Legend(opacity: 0.7, position: LegendPosition.bottom),
      title: ChartTitle(
          text: 'Average sales comparison\n',
          textStyle: FxTextStyle.bodySmall()),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          interval: 1,
          intervalType: DateTimeIntervalType.years,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}M',
          //title: AxisTitle(text: 'Revenue in millions'),
          interval: 1,
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getDefaultAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<AreaSeries<ChartSampleData, DateTime>> _getDefaultAreaSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: DateTime(2000, 1, 1), y: 4, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2001, 1, 1), y: 3.0, secondSeriesYValue: 2.8),
      ChartSampleData(x: DateTime(2002, 1, 1), y: 3.8, secondSeriesYValue: 2.6),
      ChartSampleData(x: DateTime(2003, 1, 1), y: 3.4, secondSeriesYValue: 3),
      ChartSampleData(x: DateTime(2004, 1, 1), y: 3.2, secondSeriesYValue: 3.6),
      ChartSampleData(x: DateTime(2005, 1, 1), y: 3.9, secondSeriesYValue: 3),
    ];
    return <AreaSeries<ChartSampleData, DateTime>>[
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Product A',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Product B',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )
    ];
  }
}
