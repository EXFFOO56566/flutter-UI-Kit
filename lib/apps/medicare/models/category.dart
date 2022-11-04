import 'package:flutter/material.dart';

class Category {
  final String category;
  final IconData categoryIcon;

  Category(this.category, this.categoryIcon);

  static List<Category> categoryList() {
    List<Category> list = [];
    list.add(Category('Cardiologist', Icons.favorite));
    list.add(Category('Ophthalmologist', Icons.visibility));
    list.add(Category('Veterinarian', Icons.pets));
    list.add(Category('Paediatrician', Icons.accessibility));
    list.add(Category('Gynaecologist', Icons.pregnant_woman));

    return list;
  }
}
