import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/login_screen.dart';

class SplashController extends FxController {
  TickerProvider ticker;
  SplashController(this.ticker);
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: ticker,
    );
    animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 0))
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
  }

  void goToLoginScreen() {
    // animationController.forward();
    // await Future.delayed(Duration(milliseconds: 500));
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  String getTag() {
    return "splash_controller";
  }
}
