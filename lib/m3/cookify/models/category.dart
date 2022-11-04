import 'package:flutx/flutx.dart';

class Category {
  final FxTwoToneIconData icon;
  final String title;

  Category(this.icon, this.title);

  static List<Category> getList() {
    return [
      Category(FxTwoToneMdiIcons.kitchen, "All"),
      Category(FxTwoToneMdiIcons.fastfood, "Fastfood"),
      Category(FxTwoToneMdiIcons.local_pizza, "Pizza"),
      Category(FxTwoToneMdiIcons.cake, "Cake"),
      Category(FxTwoToneMdiIcons.set_meal, "Sea Food"),
      Category(FxTwoToneMdiIcons.local_cafe, "Tea"),
    ];
  }
}
