import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/analytics_controller.dart';
import '../models/charts_sample_data.dart';
import '../models/daily_exercise.dart';
import '../models/spline_area_data.dart';

class AnalyticsScreen extends StatefulWidget {
  AnalyticsScreen({Key? key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late AnalyticsController controller;

  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarSeries() {
    final List<RadialBarSeries<ChartSampleData, String>> list =
        <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
          animationDuration: 1000,
          maximumValue: 100,
          radius: '100%',
          gap: '10%',
          innerRadius: '30%',
          dataSource: controller.chartData,
          cornerStyle: CornerStyle.bothCurve,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings: DataLabelSettings(isVisible: false))
    ];
    return list;
  }

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(AnalyticsController());
  }

  SfCircularChart _buildAngleRadialBarChart() {
    return SfCircularChart(
      margin: EdgeInsets.zero,
      legend: Legend(
          isVisible: true,
          width: "400",
          itemPadding: 0,
          position: LegendPosition.bottom,
          legendItemBuilder: (String legendText, dynamic series, dynamic point,
              int seriesIndex) {
            return Container(
              width: 110,
              margin: FxSpacing.top(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    controller.icons[seriesIndex],
                    size: 20,
                    color: controller.chartData[seriesIndex].pointColor,
                  ),
                  FxSpacing.width(8),
                  FxText.labelMedium(controller.chartData[seriesIndex].text!),
                ],
              ),
            );
          },
          overflowMode: LegendItemOverflowMode.none),
      series: _getRadialBarSeries(),
    );
  }

  List<Widget> _buildSingleExerciseList() {
    List<Widget> list = [];

    for (int i = 0; i < controller.dailyExercises!.length; i++) {
      list.add(_buildSingleDailyExercise(
          controller.dailyExercises![i], controller.icons[i]));
    }
    return list;
  }

  Widget _buildSingleDailyExercise(DailyExercise dailyExercise, IconData icon) {
    return FxContainer(
      onTap: () {
        controller.goToStatisticsScreen(dailyExercise, icon);
      },
      padding: FxSpacing.x(12),
      borderRadiusAll: 4,
      margin: FxSpacing.bottom(20),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: dailyExercise.color,
          ),
          FxSpacing.width(16),
          Expanded(
            child: Row(
              children: [
                FxText.titleMedium(
                  dailyExercise.achieveData.precise,
                  fontWeight: 600,
                ),
                FxSpacing.width(4),
                FxText.labelMedium(
                  dailyExercise.type,
                ),
              ],
            ),
          ),
          FxSpacing.width(16),
          FxContainer(
              borderRadiusAll: 4,
              paddingAll: 0,
              margin: FxSpacing.bottom(16),
              height: 50,
              width: 90,
              child: _buildSingleChart(
                  dailyExercise.color, dailyExercise.chartData)),
        ],
      ),
    );
  }

  SfCartesianChart _buildSingleChart(Color color, List<SplineAreaData> data) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: NumericAxis(
          isVisible: false,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          isVisible: false,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0)),
      series: controller.getAreaSeries(color, data),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<AnalyticsController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: FxText.bodyLarge(
            'Today, Wed 1 Aug',
            fontWeight: 600,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 8, 20, 0),
          children: [
            FxContainer(
              borderRadiusAll: 4,
              padding: FxSpacing.all(20),
              color: customTheme.fitnessPrimary.withAlpha(28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.labelMedium(
                        'Total calories',
                        xMuted: true,
                        letterSpacing: 0.3,
                      ),
                      FxSpacing.height(6),
                      FxText.bodyLarge(
                        '789 Cal',
                        fontWeight: 700,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.labelMedium(
                        'Active calories',
                        xMuted: true,
                        letterSpacing: 0.3,
                      ),
                      FxSpacing.height(6),
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: customTheme.fitnessPrimary,
                            size: 20,
                          ),
                          FxSpacing.width(2),
                          FxText.bodyLarge(
                            '423 Cal',
                            fontWeight: 700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            _buildAngleRadialBarChart(),
            FxSpacing.height(20),
            Column(
              children: _buildSingleExerciseList(),
            ),
          ],
        ),
      );
    }
  }
}
