import 'dart:convert';

import 'package:flutter/services.dart';

class Subscription {
  String period, trial, description;
  double price;

  Subscription(this.period, this.trial, this.description, this.price);

  static Future<List<Subscription>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Subscription> getOne() async {
    return (await getDummyList())[0];
  }

  static Subscription fromJson(Map<String, dynamic> jsonObject) {
    String period = jsonObject['period'].toString();
    String trial = jsonObject['trial'].toString();
    String description = jsonObject['description'].toString();
    double price = double.parse(jsonObject['price'].toString());

    return Subscription(period, trial, description, price);
  }

  static List<Subscription> getListFromJson(List<dynamic> jsonArray) {
    List<Subscription> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Subscription.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/full_apps/shopping/data/subscriptions.json');
  }
}
