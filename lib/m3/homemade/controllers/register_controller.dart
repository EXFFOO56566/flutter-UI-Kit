import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/full_app.dart';
import '../views/login_screen.dart';

class RegisterController extends FxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void register() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => FullApp()),
    );
  }

  void goToLogin() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => LogInScreen()),
    );
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
