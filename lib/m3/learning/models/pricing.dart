import 'dart:convert';

import 'package:flutter/services.dart';

class Pricing {
  String name, description;
  int price;

  Pricing(this.name, this.description, this.price);

  static Future<List<Pricing>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Pricing> getOne() async {
    return (await getDummyList())[0];
  }

  static Pricing fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String description = jsonObject['description'].toString();
    int price = int.parse(jsonObject['price'].toString());

    return Pricing(name, description, price);
  }

  static List<Pricing> getListFromJson(List<dynamic> jsonArray) {
    List<Pricing> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Pricing.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/learning/data/pricing.json');
  }
}
