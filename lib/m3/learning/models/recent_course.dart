import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

class RecentCourse {
  String name, time, icon, professor, description;
  Color color;
  int chapter, exam, reward;
  double completed;

  RecentCourse(this.name, this.time, this.icon, this.color, this.professor,
      this.description, this.chapter, this.exam, this.reward, this.completed);

  static Future<List<RecentCourse>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<RecentCourse> getOne() async {
    return (await getDummyList())[0];
  }

  static RecentCourse fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String time = jsonObject['time'].toString();
    String icon = jsonObject['icon'].toString();
    String professor = jsonObject['professor'].toString();
    String description = jsonObject['description'].toString();
    Color color = jsonObject['color'].toString().toColor;
    int chapter = jsonObject['chapter'].toString().toInt() ?? 0;
    int exam = jsonObject['exam'].toString().toInt() ?? 0;
    int reward = jsonObject['reward'].toString().toInt() ?? 0;
    double completed = jsonObject['completed'].toString().toDouble() ?? 0;

    return RecentCourse(name, time, icon, color, professor, description,
        chapter, exam, reward, completed);
  }

  static List<RecentCourse> getListFromJson(List<dynamic> jsonArray) {
    List<RecentCourse> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(RecentCourse.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/m3/learning/data/recent_courses.json');
  }
}
