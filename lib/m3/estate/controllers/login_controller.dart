import 'package:flutkit/m3/estate/views/forgot_password_screen.dart';
import 'package:flutkit/m3/estate/views/full_app_screen.dart';
import 'package:flutkit/m3/estate/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class LogInController extends FxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void goToForgotPasswordScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }

  void goToRegisterScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  void goToHomeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FullAppScreen()),
    );
  }

  @override
  String getTag() {
    return "login_controller";
  }
}
