import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'product.dart';

class Cart {
  Product product;
  String selectedSize;
  int quantity;
  Color selectedColor;

  Cart(this.product, this.selectedSize, this.quantity, this.selectedColor);

  static Future<List<Cart>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Cart> getOne() async {
    return (await getDummyList())[0];
  }

  static Future<Cart> fromJson(Map<String, dynamic> jsonObject) async {
    Product product = Product.fromJson(jsonObject['product']);
    String selectedSize = jsonObject['selectedSize'].toString();
    int quantity = int.parse(jsonObject['quantity'].toString());
    Color selectedColor = jsonObject['selectedColor'].toString().toColor;

    return Cart(product, selectedSize, quantity, selectedColor);
  }

  static Future<List<Cart>> getListFromJson(List<dynamic> jsonArray) async {
    List<Cart> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(await Cart.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/full_apps/shopping/data/cart.json');
  }
}
