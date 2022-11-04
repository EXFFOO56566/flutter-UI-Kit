import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialOverfilled extends StatefulWidget {
  RadialOverfilled({Key? key}) : super(key: key);

  @override
  _RadialOverfilledState createState() => _RadialOverfilledState();
}

class _RadialOverfilledState extends State<RadialOverfilled> {
  late TooltipBehavior _tooltipBehavior;
  final List<_ChartData> chartData = <_ChartData>[
    _ChartData(
        'Low \n3.5k/6k', 3500, const Color.fromRGBO(235, 97, 143, 1), 'Low'),
    _ChartData('Average \n7.2k/6k', 7200,
        const Color.fromRGBO(145, 132, 202, 1), 'Average'),
    _ChartData('High \n10.5k/6k', 10500, const Color.fromRGBO(69, 187, 161, 1),
        'High'),
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildAngleRadialBarChart()));
  }

  SfCircularChart _buildAngleRadialBarChart() {
    return SfCircularChart(
        key: GlobalKey(),
        legend: Legend(
            toggleSeriesVisibility: false,
            isVisible: true,
            iconHeight: 20,
            position: LegendPosition.bottom,
            iconWidth: 20,
            overflowMode: LegendItemOverflowMode.wrap),
        title: ChartTitle(
            text: 'Monthly steps count tracker',
            textStyle: FxTextStyle.bodySmall()),
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            angle: 0,
            radius: '0%',
            height: '45%',
            width: '65%',
            widget: Container(
              child: Column(
                children: <Widget>[
                  Text('Goal -',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('6k steps/day',
                      softWrap: false,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
                ],
              ),
            ),
          ),
        ],
        series: _getRadialBarSeries(),
        tooltipBehavior: _tooltipBehavior,
        onTooltipRender: (TooltipArgs args) {
          args.text = chartData[args.pointIndex as int].text +
              ' : ' +
              chartData[args.pointIndex as int].y.toString();
        });
  }

  List<RadialBarSeries<_ChartData, String>> _getRadialBarSeries() {
    final List<RadialBarSeries<_ChartData, String>> list =
        <RadialBarSeries<_ChartData, String>>[
      RadialBarSeries<_ChartData, String>(
          maximumValue: 6000,
          radius: '100%',
          gap: '3%',
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          pointColorMapper: (_ChartData data, _) => data.color,
          dataLabelMapper: (_ChartData data, _) => data.text,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
    return list;
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color, this.text);

  final String x;
  final num? y;
  final Color color;
  final String text;
}
