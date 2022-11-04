import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class FavoriteController extends FxController {
  String status = "Unfavorite";
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation<double?> sizeAnimation, paddingAnimation;
  bool isFav = false;
  TickerProvider ticker;

  FavoriteController(this.ticker);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 500));

    colorAnimation = ColorTween(begin: Colors.grey.shade400, end: Colors.red)
        .animate(animationController);
    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 80), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 80, end: 50), weight: 50)
    ]).animate(animationController);
    paddingAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 16, end: 1), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 16), weight: 50)
    ]).animate(animationController);

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
  }

  void onClick() {
    if (status.compareTo("Unfavorite") == 0) {
      status = "Favorite";
      update();
    } else {
      status = "Unfavorite";
      update();
    }
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  String getTag() {
    return "animation_favorite_controller";
  }
}
