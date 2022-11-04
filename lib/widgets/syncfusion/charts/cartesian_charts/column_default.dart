import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class ColumnDefault extends StatefulWidget {
  ColumnDefault({Key? key}) : super(key: key);

  @override
  _ColumnDefaultState createState() => _ColumnDefaultState();
}

class _ColumnDefaultState extends State<ColumnDefault> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildDefaultColumnChart()),
    );
  }

  SfCartesianChart _buildDefaultColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
        text: 'Population growth of various countries\n',
        textStyle: FxTextStyle.bodySmall(),
      ),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          labelFormat: '{value}%',
          majorTickLines: MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getDefaultColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'China', y: 0.541),
      ChartSampleData(x: 'Brazil', y: 0.818),
      ChartSampleData(x: 'Bolivia', y: 1.51),
      ChartSampleData(x: 'Mexico', y: 1.302),
      ChartSampleData(x: 'Egypt', y: 2.017),
      ChartSampleData(x: 'Mongolia', y: 1.683),
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}
