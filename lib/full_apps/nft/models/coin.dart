import 'dart:convert';

import 'package:flutkit/extensions/extensions.dart';
import 'package:flutter/services.dart';

class Coin {
  String name, image, code;
  double price, priceChange, percentChange;
  DateTime date;

  Coin(this.name, this.image, this.code, this.price, this.priceChange,
      this.percentChange, this.date);
  static Future<List<Coin>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Coin> getOne() async {
    return (await getDummyList())[0];
  }

  static Future<Coin> fromJson(Map<String, dynamic> jsonObject) async {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String code = jsonObject['code'].toString();
    double? price = jsonObject['price'].toString().toDouble(0);
    double? priceChange = jsonObject['price_change'].toString().toDouble(0);
    double? percentChange = jsonObject['percent_change'].toString().toDouble(0);
    DateTime date = DateTime.parse(jsonObject['date'].toString());

    return Coin(name, image, code, price!, priceChange!, percentChange!, date);
  }

  static Future<List<Coin>> getListFromJson(List<dynamic> jsonArray) async {
    List<Coin> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(await Coin.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/full_apps/nft/data/coins.json');
  }
}
