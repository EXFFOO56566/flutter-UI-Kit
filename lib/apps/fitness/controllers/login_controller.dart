import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/forgot_password_screen.dart';
import '../views/full_app.dart';
import '../views/register_screen.dart';

class LogInController extends FxController {
  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();

  LogInController() {
    this.emailTE = TextEditingController(text: 'flutkit@coderthemes.com');
    this.passwordTE = TextEditingController(text: 'password');
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
    }
  }

  void goToForgotPasswordScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordScreen(),
      ),
    );
  }

  void goToRegisterScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "login_controller";
  }
}
