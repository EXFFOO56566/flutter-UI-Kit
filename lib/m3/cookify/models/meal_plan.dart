import 'dart:convert';

import 'package:flutter/services.dart';

class MealPlan {
  final String type, image, title, time;

  MealPlan(this.type, this.image, this.title, this.time);

  static Future<List<MealPlan>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<MealPlan> getOne() async {
    return (await getDummyList())[0];
  }

  static MealPlan fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String title = jsonObject['title'].toString();
    String time = jsonObject['time'].toString();

    return MealPlan(name, image, title, time);
  }

  static List<MealPlan> getListFromJson(List<dynamic> jsonArray) {
    List<MealPlan> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(MealPlan.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/cookify/data/meal_plans.json');
  }
}
