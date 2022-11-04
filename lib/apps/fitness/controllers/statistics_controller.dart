import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/daily_exercise.dart';
import '../models/spline_area_data.dart';

class StatisticsController extends FxController {
  DailyExercise dailyExercise;
  IconData icon;

  StatisticsController(this.dailyExercise, this.icon);

  bool showLoading = true, uiLoading = true;

  @override
  void initState() {
    super.initState();
    super.save = false;
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  List<ChartSeries<SplineAreaData, double>> getSplineAreaSeries() {
    return <ChartSeries<SplineAreaData, double>>[
      SplineAreaSeries<SplineAreaData, double>(
        dataSource: dailyExercise.chartData,
        gradient: LinearGradient(
          colors: [
            dailyExercise.color.withAlpha(150),
            dailyExercise.color.withAlpha(100),
            dailyExercise.color.withAlpha(40),
            dailyExercise.color.withAlpha(20),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderColor: dailyExercise.color,
        borderWidth: 2,
        xValueMapper: (SplineAreaData sales, _) => sales.calories,
        yValueMapper: (SplineAreaData sales, _) => sales.day,
      ),
    ];
  }

  @override
  String getTag() {
    return "statistics_controller";
  }
}
