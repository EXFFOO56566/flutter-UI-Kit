import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/sales_data.dart';

class BoxWhiskerDefault extends StatefulWidget {
  BoxWhiskerDefault({Key? key}) : super(key: key);

  @override
  _BoxWhiskerDefaultState createState() => _BoxWhiskerDefaultState();
}

class _BoxWhiskerDefaultState extends State<BoxWhiskerDefault> {
  late BoxPlotMode _boxMode;
  late bool _mean;
  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(height: 320, child: _buildDefaultWhiskerChart()),
    );
  }

  SfCartesianChart _buildDefaultWhiskerChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Employees age group in various departments\n',
          textStyle: FxTextStyle.bodySmall()),
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelIntersectAction: AxisLabelIntersectAction.rotate45),
      primaryYAxis: NumericAxis(
          name: 'Age',
          minimum: 10,
          maximum: 60,
          interval: 10,
          axisLine: const AxisLine(width: 0),
          majorTickLines:
              const MajorTickLines(size: 8, color: Colors.transparent)),
      series: _getBoxWhiskerSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  ///Get the histogram series
  List<BoxAndWhiskerSeries<SalesData, dynamic>> _getBoxWhiskerSeries() {
    final List<SalesData> chartData = <SalesData>[
      SalesData(
          'Development',
          <int>[
            22,
            22,
            23,
            25,
            25,
            25,
            26,
            27,
            27,
            28,
            28,
            29,
            30,
            32,
            34,
            32,
            34,
            36,
            35,
            38
          ],
          null,
          const Color.fromRGBO(75, 135, 185, 0.9)),
      SalesData(
          'HR',
          <int>[22, 24, 25, 30, 32, 34, 36, 38, 39, 41, 35, 36, 40, 56],
          null,
          const Color.fromRGBO(75, 135, 185, 0.9)),
      SalesData('Finance  ', <int>[26, 27, 28, 30, 32, 34, 35, 37, 35, 37, 45],
          null, const Color.fromRGBO(75, 135, 185, 0.9)),
      SalesData('Inventory', <int>[21, 23, 24, 25, 26, 27, 28, 30, 34, 36, 38],
          null, const Color.fromRGBO(75, 135, 185, 0.9)),
      SalesData('Sales', <int>[27, 26, 28, 29, 29, 29, 32, 35, 32, 38, 53],
          null, const Color.fromRGBO(75, 135, 185, 0.9)),
      SalesData(
          'R&D',
          <int>[26, 27, 29, 32, 34, 35, 36, 37, 38, 39, 41, 43, 58],
          null,
          const Color.fromRGBO(75, 135, 185, 0.9)),
      SalesData('Graphics', <int>[26, 28, 29, 30, 32, 33, 35, 36, 52], null,
          const Color.fromRGBO(75, 135, 185, 0.9)),
    ];
    return <BoxAndWhiskerSeries<SalesData, dynamic>>[
      BoxAndWhiskerSeries<SalesData, dynamic>(
        name: 'Department',
        dataSource: chartData,
        showMean: _mean,
        boxPlotMode: _boxMode,
        borderColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        xValueMapper: (SalesData sales, _) => sales.x,
        yValueMapper: (SalesData sales, _) => sales.y,
        pointColorMapper: (SalesData sales, _) => sales.color,
      )
    ];
  }

  @override
  void initState() {
    _mean = true;
    _boxMode = BoxPlotMode.normal;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
}
