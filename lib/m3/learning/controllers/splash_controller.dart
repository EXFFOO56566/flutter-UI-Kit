import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/login_screen.dart';

class SplashController extends FxController {
  @override
  void initState() {
    super.initState();
  }

  void goToLogInScreen() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "splash_controller";
  }
}
