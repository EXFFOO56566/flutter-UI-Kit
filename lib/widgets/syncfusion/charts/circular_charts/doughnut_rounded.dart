import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class DoughnutRounded extends StatefulWidget {
  DoughnutRounded({Key? key}) : super(key: key);

  @override
  _DoughnutRoundedState createState() => _DoughnutRoundedState();
}

class _DoughnutRoundedState extends State<DoughnutRounded> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildRoundedDoughnutChart()));
  }

  SfCircularChart _buildRoundedDoughnutChart() {
    return SfCircularChart(
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      title: ChartTitle(
          text: 'Software development cycle',
          textStyle: FxTextStyle.bodySmall()),
      series: _getRoundedDoughnutSeries(),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getRoundedDoughnutSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Planning', y: 10),
      ChartSampleData(x: 'Analysis', y: 10),
      ChartSampleData(x: 'Design', y: 10),
      ChartSampleData(x: 'Development', y: 10),
      ChartSampleData(x: 'Testing & Integration', y: 10),
      ChartSampleData(x: 'Maintainance', y: 10)
    ];
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        dataSource: chartData,
        animationDuration: 0,
        cornerStyle: CornerStyle.bothCurve,
        radius: '80%',
        innerRadius: '60%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
      ),
    ];
  }
}
