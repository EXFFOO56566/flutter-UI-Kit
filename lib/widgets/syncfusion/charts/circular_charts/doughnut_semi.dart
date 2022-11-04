import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class DoughnutSemi extends StatefulWidget {
  DoughnutSemi({Key? key}) : super(key: key);

  @override
  _DoughnutSemiState createState() => _DoughnutSemiState();
}

class _DoughnutSemiState extends State<DoughnutSemi> {
  int startAngle = 270;
  int endAngle = 90;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildSemiDoughnutChart()));
  }

  SfCircularChart _buildSemiDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Sales by sales person', textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      centerY: '60%',
      series: _getSemiDoughnutSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<DoughnutSeries<ChartSampleData, String>> _getSemiDoughnutSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'David', y: 45, text: 'David 45%'),
      ChartSampleData(x: 'Steve', y: 15, text: 'Steve 15%'),
      ChartSampleData(x: 'Jack', y: 21, text: 'Jack 21%'),
      ChartSampleData(x: 'Others', y: 19, text: 'Others 19%')
    ];
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          dataSource: chartData,
          innerRadius: '70%',
          radius: '59%',
          startAngle: startAngle,
          endAngle: endAngle,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}
