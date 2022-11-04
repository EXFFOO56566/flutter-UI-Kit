import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/login_screen.dart';

class SplashController extends FxController {
  bool showLoading = true, uiLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToLogInScreen() {
    Navigator.push(
      context,
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
