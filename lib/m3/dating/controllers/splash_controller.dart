import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/home_screen.dart';

class SplashController extends FxController {
  void goToHomeScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  String getTag() {
    return "splash_controller";
  }
}
