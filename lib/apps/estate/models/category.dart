import 'package:flutter/material.dart';

class Category {
  final String category;
  final IconData categoryIcon;

  Category(this.category, this.categoryIcon);

  static List<Category> categoryList() {
    List<Category> list = [];
    list.add(Category('Apartment', Icons.apartment_outlined));
    list.add(Category('Cottage', Icons.cottage_outlined));
    list.add(Category('Business Hub', Icons.business_outlined));
    list.add(Category('Beach House', Icons.deck_outlined));
    list.add(Category('Villa', Icons.villa_outlined));
    list.add(Category('Foundation', Icons.foundation_outlined));

    return list;
  }
}
