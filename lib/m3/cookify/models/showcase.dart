import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

class Showcase {
  final String image, title, body;
  final int likes, timeInMinutes, ingredients;

  Showcase(this.image, this.title, this.body, this.likes, this.timeInMinutes,
      this.ingredients);

  static Future<List<Showcase>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Showcase> getOne() async {
    return (await getDummyList())[0];
  }

  static Showcase fromJson(Map<String, dynamic> jsonObject) {
    String image = jsonObject['image'].toString();
    String title = jsonObject['title'].toString();
    String body = jsonObject['body'].toString();
    int likes = jsonObject['likes'].toString().toInt() ?? 0;
    int timeInMinutes = jsonObject['time'].toString().toInt() ?? 0;
    int ingredients = jsonObject['ingredients'].toString().toInt() ?? 0;

    return Showcase(image, title, body, likes, timeInMinutes, ingredients);
  }

  static List<Showcase> getListFromJson(List<dynamic> jsonArray) {
    List<Showcase> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Showcase.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/cookify/data/showcases.json');
  }
}
