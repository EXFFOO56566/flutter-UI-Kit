import 'package:flutkit/utils/generator.dart';

class Product {
  final String name, description, image;
  final double price, discountedPrice;

  Product(this.name, this.description, this.image, this.price,
      this.discountedPrice);

  static List<Product> getList() {
    return [
      Product("Orange Fresh Juice", Generator.getDummyText(8),
          "./assets/images/apps/grocery/product-2.png", 59.99, 49.99),
      Product("Fresh Carrot", Generator.getDummyText(8),
          "./assets/images/apps/grocery/product-5.png", 19.99, 19.99),
      Product("Juicy Grapes", Generator.getDummyText(8),
          "./assets/images/apps/grocery/product-3.png", 35, 35),
      Product("Green Broccoli", Generator.getDummyText(8),
          "./assets/images/apps/grocery/product-1.png", 39.99, 29.99),
      Product("Cauliflower", Generator.getDummyText(8),
          "./assets/images/apps/grocery/product-4.png", 25, 25),
    ];
  }
}
