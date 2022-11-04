import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class PyramidLabel extends StatefulWidget {
  PyramidLabel({Key? key}) : super(key: key);

  @override
  _PyramidLabelState createState() => _PyramidLabelState();
}

class _PyramidLabelState extends State<PyramidLabel> {
  ChartDataLabelPosition _selectedLabelPosition =
      ChartDataLabelPosition.outside;

  // SmartLabelMode _mode = SmartLabelMode.shift;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildPyramidSmartLabelChart()));
  }

  SfPyramidChart _buildPyramidSmartLabelChart() {
    return SfPyramidChart(
      onTooltipRender: (TooltipArgs args) {
        args.text = args.dataPoints![args.pointIndex!.toInt()].y.toString();
      },
      title: ChartTitle(
          text: 'Top 10 populated countries - 2019',
          textStyle: FxTextStyle.bodySmall()),
      tooltipBehavior: TooltipBehavior(enable: true),
      // smartLabelMode: _mode,
      series: _getPyramidSeries(),
    );
  }

  PyramidSeries<ChartSampleData, String> _getPyramidSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(
          x: 'Mexico',
          y: 127575529,
          text: null,
          pointColor: const Color.fromRGBO(238, 238, 238, 1)),
      ChartSampleData(
          x: 'Russia ',
          y: 145872256,
          text: null,
          pointColor: const Color.fromRGBO(255, 240, 219, 1)),
      ChartSampleData(
          x: 'Bangladesh',
          y: 163046161,
          text: null,
          pointColor: const Color.fromRGBO(255, 205, 96, 1)),
      ChartSampleData(
          x: 'Nigeria ',
          y: 200963599,
          text: null,
          pointColor: const Color.fromRGBO(73, 76, 162, 1)),
      ChartSampleData(
          x: 'Brazil',
          y: 211049527,
          text: null,
          pointColor: const Color.fromRGBO(0, 168, 181, 1)),
      ChartSampleData(
          x: 'Pakistan ',
          y: 216565318,
          text: null,
          pointColor: const Color.fromRGBO(116, 180, 155, 1)),
      ChartSampleData(
          x: 'Indonesia',
          y: 270625568,
          text: null,
          pointColor: const Color.fromRGBO(248, 177, 149, 1)),
      ChartSampleData(
          x: 'US',
          y: 329064917,
          text: null,
          pointColor: const Color.fromRGBO(246, 114, 128, 1)),
      ChartSampleData(
          x: 'India',
          y: 1366417754,
          text: null,
          pointColor: const Color.fromRGBO(192, 108, 132, 1)),
      ChartSampleData(
          x: 'China',
          y: 1433783686,
          text: null,
          pointColor: const Color.fromRGBO(53, 92, 125, 1)),
    ];
    return PyramidSeries<ChartSampleData, String>(
        width: '60%',
        dataSource: pieData,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        textFieldMapper: (ChartSampleData data, _) => data.x as String,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        dataLabelSettings: DataLabelSettings(
            isVisible: true,
            labelPosition: _selectedLabelPosition,
            useSeriesColor: true));
  }
}
