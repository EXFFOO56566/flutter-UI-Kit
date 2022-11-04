import 'dart:convert';

import 'package:flutter/services.dart';

class Category {
  String name, url, description;

  Category(this.name, this.url, this.description);

  static Future<List<Category>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Category> getOne() async {
    return (await getDummyList())[0];
  }

  static Category fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String url = jsonObject['url'].toString();
    String description = jsonObject['description'].toString();

    return Category(name, url, description);
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
        .loadString('lib/apps/homemade/data/categories.json');
  }

  @override
  String toString() {
    return 'ProductImage{name: $name, url: $url, description: $description}';
  }
}
