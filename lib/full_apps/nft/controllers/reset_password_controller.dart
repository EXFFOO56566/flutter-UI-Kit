import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/full_app.dart';
import '../views/register_screen.dart';

class ResetPasswordController extends FxController {
  late TextEditingController confirmPasswordTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  bool enableConfirmPass = false;
  bool enablePass = false;

  @override
  void initState() {
    super.initState();
    confirmPasswordTE = TextEditingController(text: 'password123');
    passwordTE = TextEditingController(text: 'password');
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

  void togglePassword() {
    enablePass = !enablePass;
    update();
  }

  void toggleConfirmPassword() {
    enableConfirmPass = !enableConfirmPass;
    update();
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NFTFullApp(),
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
    return "reset_password_controller";
  }
}
