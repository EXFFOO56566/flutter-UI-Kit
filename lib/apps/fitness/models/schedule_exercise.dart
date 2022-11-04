import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/exercise.dart';

class ScheduleExercise {
  String date, day;
  List<Exercise> exercises;

  ScheduleExercise(this.date, this.day, this.exercises);

  static Future<List<ScheduleExercise>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<ScheduleExercise> getOne() async {
    return (await getDummyList())[0];
  }

  static ScheduleExercise fromJson(Map<String, dynamic> jsonObject) {
    String date = jsonObject['date'].toString();
    String day = jsonObject['day'].toString();
    List<Exercise> exercises =
        Exercise.getListFromJson(jsonObject['exercises']);
    return ScheduleExercise(date, day, exercises);
  }

  static List<ScheduleExercise> getListFromJson(List<dynamic> jsonArray) {
    List<ScheduleExercise> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(ScheduleExercise.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/apps/fitness/data/schedule_exercises.json');
  }
}
