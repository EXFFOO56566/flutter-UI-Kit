import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'agent.dart';

class House {
  final String name, image, location, description;
  double price, area;
  int bedrooms, bathrooms, floors;
  final Agent agent;
  House(this.name, this.image, this.location, this.description, this.price,
      this.area, this.bedrooms, this.bathrooms, this.floors, this.agent);

  static Future<List<House>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<House> getOne() async {
    return (await getDummyList())[0];
  }

  static House fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String location = jsonObject['location'].toString();
    String description = jsonObject['description'].toString();
    double price = jsonObject['price'].toString().toDouble() ?? 0;
    double area = jsonObject['area'].toString().toDouble() ?? 0;
    int bedrooms = jsonObject['bedrooms'].toString().toInt() ?? 0;
    int bathrooms = jsonObject['bathrooms'].toString().toInt() ?? 0;
    int floors = jsonObject['floors'].toString().toInt() ?? 0;
    Agent agent = Agent.fromJson(jsonObject['agent']);

    return House(name, image, location, description, price, area, bedrooms,
        bathrooms, floors, agent);
  }

  static List<House> getListFromJson(List<dynamic> jsonArray) {
    List<House> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(House.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/estate/data/houses.json');
  }
}
