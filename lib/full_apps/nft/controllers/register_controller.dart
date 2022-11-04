import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/home_screen.dart';
import '../views/login_screen.dart';

class RegisterController extends FxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enable = false;

  @override
  void initState() {
    super.initState();
    save = false;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter  name";
    }
    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (!FxStringValidator.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(text, 6, 10)) {
      return "Password must be between 6 to 10";
    }
    return null;
  }

  void toggle() {
    enable = !enable;
    update();
  }

  void goToLoginScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  String getTag() {
    return "register_controller";
  }
}
