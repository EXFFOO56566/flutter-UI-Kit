import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class RangeColumnDefault extends StatefulWidget {
  RangeColumnDefault({Key? key}) : super(key: key);

  @override
  _RangeColumnDefaultState createState() => _RangeColumnDefaultState();
}

class _RangeColumnDefaultState extends State<RangeColumnDefault> {
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
      child: Container(height: 320, child: _buildDefaultRangeColumnChart()),
    );
  }

  SfCartesianChart _buildDefaultRangeColumnChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Average half-yearly temperature variation of London, UK\n',
          textStyle: FxTextStyle.bodySmall()),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          interval: 5,
          labelFormat: '{value}°C',
          majorTickLines: MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getDefaultRangeColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  List<RangeColumnSeries<ChartSampleData, String>>
      _getDefaultRangeColumnSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(x: 'Jan', y: 3, yValue: 6),
      ChartSampleData(x: 'Feb', y: 3, yValue: 7),
      ChartSampleData(x: 'Mar', y: 4, yValue: 10),
      ChartSampleData(x: 'Apr', y: 6, yValue: 13),
      ChartSampleData(x: 'May', y: 9, yValue: 17),
      ChartSampleData(x: 'June', y: 12, yValue: 20),
    ];
    return <RangeColumnSeries<ChartSampleData, String>>[
      RangeColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        lowValueMapper: (ChartSampleData sales, _) => sales.y,
        highValueMapper: (ChartSampleData sales, _) => sales.yValue,
        dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
            textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}
