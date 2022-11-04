import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/recent_exercise.dart';
import '../models/spline_area_data.dart';
import '../views/relaxation_screen.dart';
import '../views/subscription_screen.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<RecentExercise>? exercises;

  final List<SplineAreaData> chartData = <SplineAreaData>[
    SplineAreaData(
      1,
      1.2,
    ),
    SplineAreaData(
      2,
      1.0,
    ),
    SplineAreaData(
      3,
      1.5,
    ),
    SplineAreaData(
      4,
      2.2,
    ),
    SplineAreaData(
      5,
      2.5,
    ),
    SplineAreaData(
      6,
      2.6,
    ),
    SplineAreaData(
      7,
      2.8,
    ),
    SplineAreaData(
      8,
      3.0,
    ),
    SplineAreaData(
      9,
      2.5,
    ),
    SplineAreaData(
      10,
      1.8,
    ),
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    exercises = await RecentExercise.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSubscriptionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionScreen(),
      ),
    );
  }

  List<ChartSeries<SplineAreaData, double>> getSplineAreaSeries() {
    return <ChartSeries<SplineAreaData, double>>[
      SplineAreaSeries<SplineAreaData, double>(
        dataSource: chartData,
        gradient: LinearGradient(
          colors: [
            AppTheme.customTheme.fitnessPrimary.withAlpha(150),
            AppTheme.customTheme.fitnessPrimary.withAlpha(100),
            AppTheme.customTheme.fitnessPrimary.withAlpha(40),
            AppTheme.customTheme.fitnessPrimary.withAlpha(20),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderColor: AppTheme.customTheme.fitnessPrimary,
        borderWidth: 2,
        xValueMapper: (SplineAreaData sales, _) => sales.calories,
        yValueMapper: (SplineAreaData sales, _) => sales.day,
      ),
    ];
  }

  void goToRelaxationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RelaxationScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
