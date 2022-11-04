import 'package:flutkit/m3/cookify/views/forgot_password_screen.dart';
import 'package:flutkit/m3/cookify/views/full_app.dart';
import 'package:flutkit/m3/cookify/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class RegisterController extends FxController {
  late TextEditingController nameTE, emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();

  RegisterController() {
    this.nameTE = TextEditingController();
    this.emailTE = TextEditingController();
    this.passwordTE = TextEditingController();
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

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter name";
    } else if (!FxStringValidator.validateStringRange(text, 4, 20)) {
      return "Password length must between 4 and 20";
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

  void register() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
    }
  }

  void goToLogInScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
