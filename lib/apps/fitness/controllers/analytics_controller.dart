import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/charts_sample_data.dart';
import '../models/daily_exercise.dart';
import '../models/spline_area_data.dart';
import '../views/statistics_screen.dart';

class AnalyticsController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<DailyExercise>? dailyExercises;

  List<IconData> icons = [
    Icons.directions_run,
    Icons.fitness_center,
    Icons.directions_bike,
  ];

  List<ChartSampleData> chartData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    dailyExercises = await DailyExercise.getDummyList();
    chartData.clear();
    for (DailyExercise dailyExercise in dailyExercises!) {
      chartData.add(ChartSampleData(
          x: '',
          y: dailyExercise.achieveData! * 100 ~/ dailyExercise.goalData!,
          text: dailyExercise.name,
          xValue: null,
          pointColor: dailyExercise.color));
    }
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToStatisticsScreen(DailyExercise dailyExercise, IconData icon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsScreen(dailyExercise, icon),
      ),
    );
  }

  List<ChartSeries<SplineAreaData, double>> getAreaSeries(
      Color color, List<SplineAreaData> data) {
    return <ChartSeries<SplineAreaData, double>>[
      SplineAreaSeries<SplineAreaData, double>(
        dataSource: data,
        gradient: LinearGradient(
          colors: [
            color.withAlpha(150),
            color.withAlpha(100),
            color.withAlpha(40),
            color.withAlpha(20),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderColor: color,
        borderWidth: 2,
        xValueMapper: (SplineAreaData sales, _) => sales.calories,
        yValueMapper: (SplineAreaData sales, _) => sales.day,
      ),
    ];
  }

  @override
  String getTag() {
    return "analytics_controller";
  }
}
