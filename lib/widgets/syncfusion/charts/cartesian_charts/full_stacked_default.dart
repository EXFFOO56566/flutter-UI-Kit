import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FullStackedDefault extends StatefulWidget {
  FullStackedDefault({Key? key}) : super(key: key);

  @override
  _FullStackedDefaultState createState() => _FullStackedDefaultState();
}

class _FullStackedDefaultState extends State<FullStackedDefault> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildStackedLine100Chart()),
    );
  }

  SfCartesianChart _buildStackedLine100Chart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Monthly expense of a family\n',
          textStyle: FxTextStyle.bodySmall()),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelRotation: -45,
      ),
      primaryYAxis: NumericAxis(
          rangePadding: ChartRangePadding.none,
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getStackedLine100Series(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<_ChartData, String>> _getStackedLine100Series() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData('Food', 55, 40, 45, 48),
      _ChartData('Transport', 33, 45, 54, 28),
      _ChartData('Medical', 43, 23, 20, 34),
      _ChartData('Clothes', 32, 54, 23, 54),
      _ChartData('Books', 56, 18, 43, 55),
      _ChartData('Others', 23, 54, 33, 56),
    ];
    return <ChartSeries<_ChartData, String>>[
      StackedLine100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.father,
          name: 'Father',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.mother,
          name: 'Mother',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.son,
          name: 'Son',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.daughter,
          name: 'Daughter',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.father, this.mother, this.son, this.daughter);

  final String x;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}
