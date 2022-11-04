import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/coin.dart';

class SplineAreaData {
  SplineAreaData(this.x, this.y);

  final double x;
  final double y;
}

class SingleCoinController extends FxController {
  Coin coin;

  SingleCoinController(this.coin);

  List<String> intervals = [];
  int selected = 1;

  @override
  void initState() {
    super.initState();
    save = false;
    intervals = ["1hr", "1d", "1w", "1m", "1y", "All"];
  }

  void changeInterval(int index) {
    if (selected != index) {
      selected = index;
      update();
    }
  }

  List<ChartSeries<SplineAreaData, double>> getCoinSeries() {
    return <ChartSeries<SplineAreaData, double>>[
      SplineAreaSeries<SplineAreaData, double>(
        dataSource: generateChartData(),
        gradient: LinearGradient(
          colors: [
            AppTheme.nftTheme.colorScheme.primary.withAlpha(100),
            AppTheme.nftTheme.colorScheme.primary.withAlpha(60),
            AppTheme.nftTheme.colorScheme.primary.withAlpha(40),
            AppTheme.nftTheme.colorScheme.primary.withAlpha(20),
            AppTheme.nftTheme.colorScheme.primary.withAlpha(0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderColor: AppTheme.customTheme.fitnessPrimary,
        borderWidth: 2,
        xValueMapper: (SplineAreaData sales, _) => sales.x,
        yValueMapper: (SplineAreaData sales, _) => sales.y,
      ),
    ];
  }

  List<SplineAreaData> generateChartData() {
    Random random = Random();
    return List.generate(
        16,
        (index) => SplineAreaData(
            (index).toDouble(), (5000 + random.nextInt(800)).toDouble()));
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "single_coin_controller";
  }
}
