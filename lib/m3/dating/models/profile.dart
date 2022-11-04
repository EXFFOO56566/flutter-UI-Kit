import 'dart:convert';

import 'package:flutter/services.dart';

class Profile {
  String name, image, description, profession, companyName;
  int age;
  List<String> interests;

  Profile(this.name, this.image, this.description, this.profession,
      this.companyName, this.age, this.interests);

  static Future<List<Profile>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Profile> getOne() async {
    return (await getDummyList())[0];
  }

  static Profile fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String description = jsonObject['description'].toString();
    String profession = jsonObject['profession'].toString();
    String companyName = jsonObject['company_name'].toString();
    int age = int.parse(jsonObject['age'].toString());
    List<String> interests = [];
    for (dynamic interest in jsonObject['interests']) {
      interests.add(interest.toString());
    }

    return Profile(
        name, image, description, profession, companyName, age, interests);
  }

  static List<Profile> getListFromJson(List<dynamic> jsonArray) {
    List<Profile> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Profile.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/dating/data/profile.json');
  }
}
