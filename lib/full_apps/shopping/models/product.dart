import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/string.dart';

class Product {
  String name, image, description;
  double price, rating;
  int review, quantity;
  Color color;
  bool favorite;

  Product(this.name, this.image, this.description, this.rating, this.price,
      this.review, this.quantity, this.color, this.favorite);

  static Future<List<Product>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Product> getOne() async {
    return (await getDummyList())[0];
  }

  static Product fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String description = jsonObject['description'].toString();
    double rating = double.parse(jsonObject['rating'].toString());
    double price = double.parse(jsonObject['price'].toString());
    int review = int.parse(jsonObject['review'].toString());
    int quantity = int.parse(jsonObject['quantity'].toString());
    Color color = jsonObject['review'].toString().toColor;
    bool favorite = jsonObject['favorite'].toString().toBool();

    return Product(name, image, description, rating, price, review, quantity,
        color, favorite);
  }

  static List<Product> getListFromJson(List<dynamic> jsonArray) {
    List<Product> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Product.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/full_apps/shopping/data/products.json');
  }
}
