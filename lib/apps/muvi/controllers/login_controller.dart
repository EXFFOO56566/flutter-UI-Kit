import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/forgot_password_screen.dart';
import '../views/full_app.dart';
import '../views/register_screen.dart';

class LoginController extends FxController {
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

  void goToForgotPasswordScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }

  void goToRegisterScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  void logIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FullApp()));
  }

  @override
  String getTag() {
    return "login_controller";
  }
}
