import 'package:flutkit/full_apps/shopping/models/cart.dart';

import 'models/category.dart';
import 'models/product.dart';

class ShoppingCache {
  static List<Category>? categories;
  static List<Product>? products;
  static List<Cart>? carts;

  static bool isFirstTime = true;
}
