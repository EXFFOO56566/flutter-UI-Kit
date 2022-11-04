import 'dart:convert';

import 'package:flutter/services.dart';

class Category {
  String name, icon;

  Category(this.name, this.icon);

  static Future<List<Category>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Category> getOne() async {
    return (await getDummyList())[0];
  }

  static Category fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String icon = jsonObject['icon'].toString();

    return Category(name, icon);
  }

  static List<Category> getListFromJson(List<dynamic> jsonArray) {
    List<Category> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Category.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/full_apps/shopping/data/categories.json');
  }
}
