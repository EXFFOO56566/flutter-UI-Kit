import 'dart:async';

import 'package:flutkit/full_apps/shopping/shopping_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutx/flutx.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../views/notification_screen.dart';
import '../views/single_product_screen.dart';
import '../views/subscription_screen.dart';

class HomeController extends FxController {
  TickerProvider ticker;
  HomeController(this.ticker);
  List<Category>? categories;
  List<Product>? products;
  late Category selectedCategory;
  late AnimationController animationController;
  late AnimationController bellController;
  late Animation<double> scaleAnimation,
      slideAnimation,
      fadeAnimation,
      bellAnimation;
  late Tween<Offset> offset;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Widget> newCategories = [];
  late Intro intro;

  @override
  void initState() {
    super.initState();
    fetchData();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: ticker,
    );
    bellController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: ticker,
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    bellAnimation = Tween<double>(begin: -0.04, end: 0.04).animate(
      CurvedAnimation(
        parent: bellController,
        curve: Curves.linear,
      ),
    );

    offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

    animationController.forward();
    bellController.repeat(reverse: true);

    intro = Intro(
      stepCount: 3,
      maskClosable: true,
      onHighlightWidgetTap: (introStatus) {
        print(introStatus);
      },
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        texts: [
          'Get your notifications from here',
          'Get latest & trending products here',
          'Get category wise products here',
        ],
        buttonTextBuilder: (currPage, totalPage) {
          return currPage < totalPage - 1 ? 'Next' : 'Finish';
        },
      ),
    );

    intro.setStepConfig(0, borderRadius: BorderRadius.circular(64));
    Timer(
      Duration(milliseconds: 2000),
      () {
        if (ShoppingCache.isFirstTime) {
          intro.start(context);
          ShoppingCache.isFirstTime = false;
        }
      },
    );
  }

  startIntro() {
    intro.start(context);
  }

  void goBack() {
    Navigator.pop(context);
  }

  Future<bool> onWillPop() async {
    IntroStatus introStatus = intro.getStatus();
    if (introStatus.isOpen) {
      intro.dispose();
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    bellController.dispose();
    super.dispose();
  }

  void fetchData() {
    categories = ShoppingCache.categories;
    products = ShoppingCache.products;
    selectedCategory = categories!.first;
  }

  void changeSelectedCategory(Category category) {
    selectedCategory = category;
    update();
  }

  void goToSingleProduct(Product product) {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (_, __, ___) => SingleProductScreen(product)),
    );
  }

  void goToSubscription() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => SubscriptionScreen(),
      ),
    );
  }

  void goToNotification() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => NotificationScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "home_controller";
  }
}
