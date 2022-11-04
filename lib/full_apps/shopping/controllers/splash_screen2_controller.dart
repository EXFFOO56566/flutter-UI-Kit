import 'package:flutkit/full_apps/shopping/shopping_constants.dart';
import 'package:flutkit/full_apps/shopping/models/cart.dart';
import 'package:flutkit/full_apps/shopping/models/product.dart';
import 'package:flutkit/full_apps/shopping/models/category.dart';
import 'package:flutkit/full_apps/shopping/views/full_app.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/controller.dart';

class SplashScreen2Controller extends FxController {
  @override
  void initState() {
    super.initState();
    goToFullApp();
  }

  goToFullApp() async {
    ShoppingCache.products = await Product.getDummyList();
    ShoppingCache.categories = await Category.getDummyList();
    ShoppingCache.carts = await Cart.getDummyList();
    await Future.delayed(Duration(seconds: 1));

    Navigator.of(context, rootNavigator: true).pushReplacement(
      PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (_, __, ___) => FullApp()),
    );
  }

  @override
  String getTag() {
    return "splash_screen_2";
  }
}
