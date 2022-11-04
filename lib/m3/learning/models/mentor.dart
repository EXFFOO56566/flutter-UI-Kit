import 'dart:convert';

import 'package:flutter/services.dart';

class Mentor {
  String name, image, position;

  Mentor(this.name, this.image, this.position);

  static Future<List<Mentor>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Mentor> getOne() async {
    return (await getDummyList())[0];
  }

  static Mentor fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String position = jsonObject['position'].toString();

    return Mentor(name, image, position);
  }

  static List<Mentor> getListFromJson(List<dynamic> jsonArray) {
    List<Mentor> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Mentor.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/learning/data/mentors.json');
  }
}
