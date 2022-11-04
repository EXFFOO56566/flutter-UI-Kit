import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  String name, description, url;
  double price, rating;
  int ratingCount, quantity;

  Product(this.name, this.description, this.url, this.price, this.rating,
      this.ratingCount, this.quantity);

  static Future<List<Product>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Product> getOne() async {
    return (await getDummyList())[0];
  }

  static Product fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String description = jsonObject['description'].toString();
    String url = jsonObject['url'].toString();

    double price = double.parse(jsonObject['price'].toString());
    double rating = double.parse(jsonObject['rating'].toString());

    int ratingCount = int.parse(jsonObject['rating_count'].toString());
    int quantity = int.parse(jsonObject['quantity'].toString());

    return Product(
        name, description, url, price, rating, ratingCount, quantity);
  }

  static List<Product> getListFromJson(List<dynamic> jsonArray) {
    List<Product> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Product.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/homemade/data/products.json');
  }

  @override
  String toString() {
    return 'ProductImage{name: $name, description: $description, price: $price, url: $url, rating: $rating}';
  }
}
