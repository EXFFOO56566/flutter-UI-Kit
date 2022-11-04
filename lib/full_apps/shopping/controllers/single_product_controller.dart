import 'package:flutkit/full_apps/shopping/shopping_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/product.dart';
import '../views/single_product_screen.dart';

class SingleProductController extends FxController {
  TickerProvider ticker;
  SingleProductController(this.ticker, this.product) {
    sizes = ['S', 'M', 'L', 'XL'];
  }
  bool showLoading = true, uiLoading = true;
  int colorSelected = 1;
  Product product;
  late AnimationController animationController, cartController;
  late Animation<Color?> colorAnimation;
  late Animation<double?> sizeAnimation, cartAnimation, paddingAnimation;

  bool isFav = false;
  bool addCart = false;

  late List<String> sizes;
  String selectedSize = 'M';

  List<Product>? products;

  @override
  void initState() {
    super.initState();
    this.save = false;
    fetchData();
    animationController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 500));

    cartController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 500));

    colorAnimation =
        ColorTween(begin: Colors.grey.shade400, end: Color(0xff1c8c8c))
            .animate(animationController);

    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 24, end: 28), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 28, end: 24), weight: 50)
    ]).animate(animationController);

    cartAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 24, end: 28), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 28, end: 24), weight: 50)
    ]).animate(cartController);

    paddingAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 16, end: 14), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 14, end: 16), weight: 50)
    ]).animate(cartController);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
        update();
      }
      if (status == AnimationStatus.dismissed) {
        isFav = false;
        update();
      }
    });

    cartController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        addCart = true;
        update();
      }
      if (status == AnimationStatus.dismissed) {
        addCart = false;
        update();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    cartController.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    product.favorite = !product.favorite;
    update();
  }

  void goBack() {
    Navigator.pop(context);
  }

  void selectSize(String size) {
    selectedSize = size;
    update();
  }

  void fetchData() async {
    products = ShoppingCache.products;
  }

  Future<void> goToCheckout() async {
    /*Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => CheckOutScreen(),
      ),
    );*/
  }

  void goToSingleProduct(Product product) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => SingleProductScreen(product),
      ),
    );
  }

  @override
  String getTag() {
    return "single_product_controller";
  }
}
