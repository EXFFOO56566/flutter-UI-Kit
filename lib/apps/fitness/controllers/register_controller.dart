import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/full_app.dart';
import '../views/login_screen.dart';

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

  @override
  void initState() {
    super.initState();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
    }
  }

  void goToLogInScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
