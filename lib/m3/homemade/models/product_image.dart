import 'dart:convert';

import 'package:flutter/services.dart';

class ProductImage {
  double height, width;
  String url, caption;

  ProductImage(this.height, this.width, this.url, this.caption);

  static Future<List<ProductImage>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static ProductImage fromJson(Map<String, dynamic> jsonObject) {
    double height = double.parse(jsonObject['height'].toString());
    double width = double.parse(jsonObject['width'].toString());
    String url = jsonObject['url'].toString();
    String caption = jsonObject['caption'].toString();
    return ProductImage(height, width, url, caption);
  }

  static List<ProductImage> getListFromJson(List<dynamic> jsonArray) {
    List<ProductImage> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(ProductImage.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle
        .loadString('lib/apps/homemade/data/product_images.json');
  }

  @override
  String toString() {
    return 'ProductImage{height: $height, width: $width, url: $url, caption: $caption}';
  }

/* {
    "url": "./assets/images/apps/homemade/cake/cake1.jpg",
    "height": "470",
    "width": "640",
    "caption": "Placeholder"
  },
  {
    "url": "./assets/images/apps/homemade/cake/cake2.jpg",
    "height": "470",
    "width": "640",
    "caption": "Placeholder"
  },
  {
    "url": "./assets/images/apps/homemade/cake/cake3.jpg",
    "height": "470",
    "width": "640",
    "caption": "Placeholder"
  },
  */
}
