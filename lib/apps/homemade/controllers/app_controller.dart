import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class AppController extends FxController {
  int currentIndex = 0;

  late TabController tabController;

  final TickerProvider ticker;

  AppController(this.ticker) {
    tabController =
        new TabController(length: 4, vsync: ticker, initialIndex: 0);
  }

  @override
  initState() {
    super.initState();

    if (tabController.animation != null)
      tabController.animation!.addListener(() {
        final aniValue = tabController.animation!.value;
        if (aniValue - currentIndex > 0.5) {
          currentIndex = currentIndex + 1;
          update();
        } else if (aniValue - currentIndex < -0.5) {
          currentIndex = currentIndex - 1;
          update();
        }
      });
  }

  onTapped(value) {
    tabController.animateTo(value);
  }

  @override
  dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  String getTag() {
    return "app_controller";
  }
}
