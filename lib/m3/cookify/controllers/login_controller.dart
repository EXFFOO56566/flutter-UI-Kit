import 'package:flutkit/m3/cookify/views/forgot_password_screen.dart';
import 'package:flutkit/m3/cookify/views/full_app.dart';
import 'package:flutkit/m3/cookify/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class LoginController extends FxController {
  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();

  LoginController() {
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

  void goToForgotPasswordScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ForgotPasswordScreen(),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
    }
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
    return "login_controller";
  }
}
