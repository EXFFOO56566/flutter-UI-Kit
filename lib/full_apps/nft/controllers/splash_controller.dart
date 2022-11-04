import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/login_screen.dart';
import '../views/register_screen.dart';

class SplashController extends FxController {
  void goToLoginScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void goToRegisterScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "splash_controller";
  }
}
