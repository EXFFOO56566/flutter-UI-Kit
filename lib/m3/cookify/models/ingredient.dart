import 'dart:convert';

import 'package:flutter/services.dart';

class Ingredient {
  final String ingredient;

  Ingredient(this.ingredient);

  static Future<List<Ingredient>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Ingredient> getOne() async {
    return (await getDummyList())[0];
  }

  static Ingredient fromJson(Map<String, dynamic> jsonObject) {
    String ingredient = jsonObject['ingredient'].toString();

    return Ingredient(ingredient);
  }

  static List<Ingredient> getListFromJson(List<dynamic> jsonArray) {
    List<Ingredient> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Ingredient.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/cookify/data/ingredients.json');
  }
}
