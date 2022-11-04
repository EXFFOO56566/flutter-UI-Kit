import 'dart:convert';

import 'package:flutter/services.dart';

class Subscription {
  String type, features;
  double price;

  Subscription(this.type, this.features, this.price);

  static Future<List<Subscription>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Subscription> getOne() async {
    return (await getDummyList())[0];
  }

  static Subscription fromJson(Map<String, dynamic> jsonObject) {
    String type = jsonObject['type'].toString();
    String features = jsonObject['features'].toString();
    double price = double.parse(jsonObject['price'].toString());
    // List<String> benefits=[];
    // for (int i = 0; i < jsonObject['benefits'].length; i++) {
    //   benefits.add(jsonObject['benefits'][i].toString());
    // }

    return Subscription(type, features, price);
  }

  static List<Subscription> getListFromJson(List<dynamic> jsonArray) {
    List<Subscription> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Subscription.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/muvi/data/subscriptions.json');
  }
}
