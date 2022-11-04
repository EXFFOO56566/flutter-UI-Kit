import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/statistics_controller.dart';
import '../models/daily_exercise.dart';

class StatisticsScreen extends StatefulWidget {
  final DailyExercise dailyExercise;
  final IconData icon;

  StatisticsScreen(
    this.dailyExercise,
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late StatisticsController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(
        StatisticsController(widget.dailyExercise, widget.icon));
  }

  SfCartesianChart _buildSplineAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: EdgeInsets.zero,
      primaryXAxis: NumericAxis(
          isVisible: true,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          isVisible: true,
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 4, color: Colors.transparent)),
      series: controller.getSplineAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<StatisticsController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              Icons.chevron_left,
              size: 20,
            ),
          ),
          title: FxText.titleMedium(
            controller.dailyExercise.name + "'s stats",
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Column(
          children: [
            FxSpacing.height(24),
            FxContainer.rounded(
              color: controller.dailyExercise.color.withAlpha(40),
              child: Icon(
                controller.icon,
                size: 28,
                color: controller.dailyExercise.color,
              ),
            ),
            FxSpacing.height(20),
            FxText.headlineSmall(
              controller.dailyExercise.achieveData.precise,
              fontWeight: 700,
            ),
            FxSpacing.height(4),
            FxText.bodySmall(
              'Goal: ' +
                  controller.dailyExercise.goalData.precise +
                  ' ' +
                  controller.dailyExercise.type,
              xMuted: true,
            ),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FxContainer.rounded(
                      paddingAll: 12,
                      color: controller.dailyExercise.color.withAlpha(28),
                      child: Icon(
                        FeatherIcons.clock,
                        size: 22,
                        color: controller.dailyExercise.color,
                      ),
                    ),
                    FxSpacing.height(8),
                    FxText.bodyMedium(
                      controller.dailyExercise.time!.textFromSeconds(
                            withHours: true,
                          ) +
                          'h ' +
                          controller.dailyExercise.time!.textFromSeconds(
                            withMinutes: true,
                          ) +
                          'm',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.bodySmall(
                      'Time',
                      xMuted: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    FxContainer.rounded(
                      paddingAll: 12,
                      color: controller.dailyExercise.color.withAlpha(28),
                      child: Icon(
                        FeatherIcons.mapPin,
                        size: 22,
                        color: controller.dailyExercise.color,
                      ),
                    ),
                    FxSpacing.height(8),
                    FxText.bodyMedium(
                      controller.dailyExercise.distance.toString() + ' km',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.bodySmall(
                      'Distance',
                      xMuted: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    FxContainer.rounded(
                      paddingAll: 12,
                      color: controller.dailyExercise.color.withAlpha(28),
                      child: Icon(
                        FeatherIcons.zap,
                        size: 22,
                        color: controller.dailyExercise.color,
                      ),
                    ),
                    FxSpacing.height(8),
                    FxText.bodyMedium(
                      controller.dailyExercise.calories.precise + ' kcal',
                      fontWeight: 600,
                    ),
                    FxSpacing.height(4),
                    FxText.bodySmall(
                      'Calories',
                      xMuted: true,
                    ),
                  ],
                ),
              ],
            ),
            FxSpacing.height(32),
            Container(
                height: 300,
                padding: FxSpacing.x(20),
                child: _buildSplineAreaChart()),
            FxSpacing.height(16),
            FxText.bodyLarge(
              'Daily Statistics',
              fontWeight: 600,
              color: theme.colorScheme.onBackground,
            ),
          ],
        ),
      );
    }
  }
}
