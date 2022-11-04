import 'package:flutter/cupertino.dart';
import 'package:flutx/flutx.dart';

class FlipController extends FxController {
  TickerProvider ticker;
  FlipController(this.ticker);
  late AnimationController animationController;
  late Animation<double> flipAnim;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: ticker);

    flipAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.linear)));
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  String getTag() {
    return "flip_controller";
  }
}
