import 'dart:convert';

import 'package:flutter/services.dart';

class Shop {
  String name, url, location, description, contact;
  double ratings;

  Shop(this.name, this.url, this.location, this.description, this.contact,
      this.ratings);

  static Future<List<Shop>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Shop> getOne() async {
    return (await getDummyList())[0];
  }

  static Shop fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String url = jsonObject['url'].toString();
    String location = jsonObject['location'].toString();
    String description = jsonObject['description'].toString();
    String contact = jsonObject['contact'].toString();
    double ratings = double.parse(jsonObject['ratings'].toString());
    return Shop(name, url, location, description, contact, ratings);
  }

  static List<Shop> getListFromJson(List<dynamic> jsonArray) {
    List<Shop> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Shop.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/homemade/data/shops.json');
  }

  @override
  String toString() {
    return 'Shop{name: $name, url: $url, location: $location, description: $description, contact: $contact}';
  }
}
