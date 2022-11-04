import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/forgot_password_screen.dart';
import '../views/full_app.dart';
import '../views/login_screen.dart';

class RegisterController extends FxController {
  bool showLoading = true, uiLoading = true;
  bool selected = true;

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

  void toggleSelect() {
    selected = !selected;
    update();
  }

  void goToForgotPasswordScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }

  void goToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void signIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FullApp()));
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
