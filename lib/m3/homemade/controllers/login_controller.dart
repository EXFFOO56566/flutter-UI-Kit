import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/forgot_password_screen.dart';
import '../views/full_app.dart';
import '../views/register_screen.dart';

class LogInController extends FxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => FullApp()),
    );
  }

  void goToForgotPassword() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }

  void goToRegister() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  String getTag() {
    return "login_controller";
  }
}
