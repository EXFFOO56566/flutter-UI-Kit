import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/full_app.dart';

class ResetPasswordController extends FxController {
  late TextEditingController confirmPasswordTE, passwordTE;

  GlobalKey<FormState> formKey = GlobalKey();

  ResetPasswordController() {
    this.confirmPasswordTE = TextEditingController(text: 'password123');
    this.passwordTE = TextEditingController(text: 'password');
  }

  @override
  void initState() {
    super.initState();
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

  String? validateConfirmPassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    } else if (passwordTE.text != text) {
      return "Both passwords are not same";
    }
    return null;
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
    }
  }

  @override
  String getTag() {
    return "reset_password_controller";
  }
}
