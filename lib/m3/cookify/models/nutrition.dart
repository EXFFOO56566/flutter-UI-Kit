import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

class Nutrition {
  final String name, unitType;
  final double unit;

  Nutrition(this.name, this.unitType, this.unit);

  static Future<List<Nutrition>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Nutrition> getOne() async {
    return (await getDummyList())[0];
  }

  static Nutrition fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String unitType = jsonObject['unit_type'].toString();
    double unit = jsonObject['unit'].toString().toDouble() ?? 0;

    return Nutrition(name, unitType, unit);
  }

  static List<Nutrition> getListFromJson(List<dynamic> jsonArray) {
    List<Nutrition> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Nutrition.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/cookify/data/nutritions.json');
  }
}
