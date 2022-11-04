import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class PyramidDefault extends StatefulWidget {
  PyramidDefault({Key? key}) : super(key: key);

  @override
  _PyramidDefaultState createState() => _PyramidDefaultState();
}

class _PyramidDefaultState extends State<PyramidDefault> {
  PyramidMode _selectedPyramidMode = PyramidMode.linear;
  double gapRatio = 0;
  bool explode = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildDefaultPyramidChart()));
  }

  SfPyramidChart _buildDefaultPyramidChart() {
    return SfPyramidChart(
      // smartLabelMode: SmartLabelMode.shift,
      title: ChartTitle(
          text: 'Comparison of calories', textStyle: FxTextStyle.bodySmall()),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getPyramidSeries(),
    );
  }

  PyramidSeries<ChartSampleData, String> _getPyramidSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'Walnuts', y: 654),
      ChartSampleData(x: 'Almonds', y: 575),
      ChartSampleData(x: 'Soybeans', y: 446),
      ChartSampleData(x: 'Black beans', y: 341),
      ChartSampleData(x: 'Mushrooms', y: 296),
      ChartSampleData(x: 'Avacado', y: 160),
    ];
    return PyramidSeries<ChartSampleData, String>(
        dataSource: pieData,
        height: '90%',
        explode: explode,
        gapRatio: gapRatio,
        pyramidMode: _selectedPyramidMode,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ));
  }
}
