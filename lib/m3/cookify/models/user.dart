import 'dart:convert';

import 'package:flutter/services.dart';

class User {
  final String email, name, image;

  User(this.email, this.name, this.image);

  static Future<List<User>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<User> getOne() async {
    return (await getDummyList())[0];
  }

  static User fromJson(Map<String, dynamic> jsonObject) {
    String email = jsonObject['email'].toString();
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();

    return User(email, name, image);
  }

  static List<User> getListFromJson(List<dynamic> jsonArray) {
    List<User> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(User.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/cookify/data/users.json');
  }
}
