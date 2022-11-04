import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/charts_sample_data.dart';

class FunnelDefault extends StatefulWidget {
  FunnelDefault({Key? key}) : super(key: key);

  @override
  _FunnelDefaultState createState() => _FunnelDefaultState();
}

class _FunnelDefaultState extends State<FunnelDefault> {
  double gapRatio = 0;
  int neckWidth = 20;
  int neckHeight = 20;
  bool explode = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildDefaultFunnelChart()));
  }

  SfFunnelChart _buildDefaultFunnelChart() {
    return SfFunnelChart(
      // smartLabelMode: SmartLabelMode.shift,

      title: ChartTitle(
          text: 'Website conversion rate', textStyle: FxTextStyle.bodySmall()),

      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      series: _getFunnelSeries(),
    );
  }

  FunnelSeries<ChartSampleData, String> _getFunnelSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'Purchased ', y: 150),
      ChartSampleData(x: 'Requested price list', y: 300),
      ChartSampleData(x: 'Downloaded trail', y: 600),
      ChartSampleData(x: 'Visit download page', y: 1500),
      ChartSampleData(x: 'Watched demo', y: 2600),
      ChartSampleData(x: 'Website visitors', y: 3000)
    ];
    return FunnelSeries<ChartSampleData, String>(
        dataSource: pieData,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        explode: explode,
        gapRatio: gapRatio,
        neckHeight: neckHeight.toString() + '%',
        neckWidth: neckWidth.toString() + '%',
        dataLabelSettings: const DataLabelSettings(isVisible: true));
  }
}
