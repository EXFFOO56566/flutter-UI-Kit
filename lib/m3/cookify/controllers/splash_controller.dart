import 'package:flutkit/m3/cookify/views/login_screen.dart';
import 'package:flutkit/m3/cookify/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class SplashController extends FxController {
  void goToLogInScreen() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void goToRegisterScreen() {
    Navigator.of(context, rootNavigator: true).push(
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
