import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class StepLineDefault extends StatefulWidget {
  StepLineDefault({Key? key}) : super(key: key);

  @override
  _StepLineDefaultState createState() => _StepLineDefaultState();
}

class _StepLineDefaultState extends State<StepLineDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildDefaultStepLineChart()),
    );
  }

  SfCartesianChart _buildDefaultStepLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Electricity-Production\n', textStyle: FxTextStyle.bodySmall()),
      primaryXAxis:
          NumericAxis(majorGridLines: MajorGridLines(width: 0), interval: 1),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 8, color: Colors.transparent),
          title: AxisTitle(
              text: 'Production (kWh)', textStyle: FxTextStyle.bodySmall()),
          labelFormat: '{value}B'),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getDefaultStepLineSeries(),
    );
  }

  /// Returns the list of chart series which need to render
  /// on the stepline chart.
  List<StepLineSeries<ChartSampleData, num>> _getDefaultStepLineSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 2000, y: 416, secondSeriesYValue: 180),
      ChartSampleData(x: 2001, y: 490, secondSeriesYValue: 240),
      ChartSampleData(x: 2002, y: 470, secondSeriesYValue: 370),
      ChartSampleData(x: 2003, y: 500, secondSeriesYValue: 200),
      ChartSampleData(x: 2004, y: 449, secondSeriesYValue: 229),
      ChartSampleData(x: 2005, y: 470, secondSeriesYValue: 210),
      ChartSampleData(x: 2006, y: 437, secondSeriesYValue: 337),
      ChartSampleData(x: 2007, y: 458, secondSeriesYValue: 258),
      ChartSampleData(x: 2008, y: 500, secondSeriesYValue: 300),
      ChartSampleData(x: 2009, y: 473, secondSeriesYValue: 173),
      ChartSampleData(x: 2010, y: 520, secondSeriesYValue: 220),
      ChartSampleData(x: 2011, y: 509, secondSeriesYValue: 309)
    ];
    return <StepLineSeries<ChartSampleData, num>>[
      StepLineSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          name: 'Renewable'),
      StepLineSeries<ChartSampleData, num>(
          dataSource: chartData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
          name: 'Non-Renewable')
    ];
  }
}
