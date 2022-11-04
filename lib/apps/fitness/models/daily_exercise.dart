import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

import '../models/spline_area_data.dart';

class DailyExercise {
  String name, type;
  int? time;
  double? distance, calories, goalData, achieveData;
  Color color;
  List<SplineAreaData> chartData;

  DailyExercise(this.name, this.type, this.time, this.distance, this.calories,
      this.goalData, this.achieveData, this.color, this.chartData);

  static Future<List<DailyExercise>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<DailyExercise> getOne() async {
    return (await getDummyList())[0];
  }

  static DailyExercise fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String type = jsonObject['type'].toString();
    int time = jsonObject['time'].toString().toInt() ?? 0;
    double distance = jsonObject['distance'].toString().toDouble() ?? 0;
    double calories = jsonObject['calories'].toString().toDouble() ?? 0;
    double goalData = jsonObject['goal_data'].toString().toDouble() ?? 0;
    double achieveData = jsonObject['achieve_data'].toString().toDouble() ?? 0;
    Color color = jsonObject['color'].toString().toColor;
    List<SplineAreaData> chartData =
        SplineAreaData.getListFromJson(jsonObject['chart_data']);

    return DailyExercise(name, type, time, distance, calories, goalData,
        achieveData, color, chartData);
  }

  static List<DailyExercise> getListFromJson(List<dynamic> jsonArray) {
    List<DailyExercise> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(DailyExercise.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/apps/fitness/data/daily_exercises.json');
  }
}
