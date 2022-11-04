import 'dart:convert';

import 'package:flutter/services.dart';

class User {
  String name, url, email;

  User(this.name, this.url, this.email);

  static Future<List<User>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<User> getOne() async {
    return (await getDummyList())[0];
  }

  static User fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String url = jsonObject['url'].toString();
    String email = jsonObject['email'].toString();

    return User(name, url, email);
  }

  static List<User> getListFromJson(List<dynamic> jsonArray) {
    List<User> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(User.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/homemade/data/users.json');
  }

  @override
  String toString() {
    return 'Shop{name: $name, url: $url, email: $email}';
  }
}
