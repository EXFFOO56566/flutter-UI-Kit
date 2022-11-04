import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Category {
  final String image, title;
  final Color color;

  Category(this.image, this.title, this.color);

  static List<Category> getList() {
    return [
      Category("./assets/images/apps/grocery/strawberry.png", "Fruit",
          CustomTheme.red.withAlpha(50)),
      Category("./assets/images/apps/grocery/bread.png", "Bread",
          CustomTheme.orange.withAlpha(60)),
      Category("./assets/images/apps/grocery/broccoli.png", "Veggie",
          CustomTheme.green.withAlpha(50)),
      Category("./assets/images/apps/grocery/cheese.png", "Dairy",
          CustomTheme.yellow.withAlpha(70)),
    ];
  }
}
