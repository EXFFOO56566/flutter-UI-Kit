import 'dart:convert';

import 'package:flutter/services.dart';

class Agent {
  String name, image, address, number, description, properties;

  Agent(this.name, this.image, this.address, this.number, this.properties,
      this.description);

  static Future<List<Agent>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Agent> getOne() async {
    return (await getDummyList())[0];
  }

  static Agent fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String address = jsonObject['address'].toString();
    String number = jsonObject['number'].toString();
    String properties = jsonObject['properties'].toString();
    String description = jsonObject['description'].toString();

    return Agent(name, image, address, number, properties, description);
  }

  static List<Agent> getListFromJson(List<dynamic> jsonArray) {
    List<Agent> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Agent.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/estate/data/agents.json');
  }

  static Agent getOneDummy() {
    return Agent(
        'Jelly Grande',
        'assets/images/profile/avatar_4.jpg',
        'DownTown, Boston',
        '+65 8123 456 7890',
        '10 Listings',
        'I provide real estates such as home, apartment, and houses to rent and buy. The modern and minimalist design interior and building will give you the greatest experience and comfortable place guarantee. What are you waiting for? Come and get it...');
  }
}
