import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

class Lecture {
  String subject;
  Color color;
  DateTime startTime, endTime;

  Lecture(this.subject, this.color, this.startTime, this.endTime);

  static Future<List<Lecture>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Lecture> getOne() async {
    return (await getDummyList())[0];
  }

  static Lecture fromJson(
    Map<String, dynamic> jsonObject,
    DateTime startTime,
    DateTime endTime,
  ) {
    String subject = jsonObject['subject'].toString();
    Color color = jsonObject['color'].toString().toColor;

    return Lecture(subject, color, startTime, endTime);
  }

  static List<Lecture> getListFromJson(List<dynamic> jsonArray) {
    List<Lecture> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Lecture.fromJson(
        jsonArray[i],
        DateTime.fromMillisecondsSinceEpoch(1635327505 * 1000)
            .add(Duration(days: i)),
        DateTime.fromMillisecondsSinceEpoch(1635327505 * 1000)
            .add(Duration(days: i, hours: 2)),
      ));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/learning/data/lectures.json');
  }
}
