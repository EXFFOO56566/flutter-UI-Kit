import 'package:flutkit/full_apps/shopping/shopping_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/product.dart';
import '../views/single_product_screen.dart';

class SearchController extends FxController {
  TickerProvider ticker;
  SearchController(this.ticker);
  List<Product>? products;
  bool showLoading = true, uiLoading = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> selectedChoices = [];
  RangeValues selectedRange = RangeValues(200, 800);
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  List<String> categoryList = [
    "T-Shirt",
    "Shirts",
    "Jeans",
    "Pants",
    "Men's wear",
    "Women's wear",
    "Nightdress",
    "Underwear",
    "Food",
    "Electronics",
    "Tech",
    "Other",
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: ticker,
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  double findAspectRatio() {
    double width = MediaQuery.of(context).size.width;
    return ((width - 58) / 2) / (250);
  }

  void goToProductScreen(Product product) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (_, __, ___) => SingleProductScreen(product)),
    );
  }

  void fetchData() async {
    products = ShoppingCache.products;
  }

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeEndDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void addChoice(String item) {
    selectedChoices.add(item);
    update();
  }

  void removeChoice(String item) {
    selectedChoices.remove(item);
    update();
  }

  void onChangePriceRange(RangeValues newRange) {
    selectedRange = newRange;
    update();
  }

  @override
  String getTag() {
    return "search_controller";
  }
}
