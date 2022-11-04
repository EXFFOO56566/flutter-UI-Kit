import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../nft_cache.dart';
import '../views/forgot_password_screen.dart';
import '../views/full_app.dart';
import '../views/register_screen.dart';

class LoginController extends FxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = true;

  @override
  void initState() {
    super.initState();
    save = false;
    this.emailController =
        TextEditingController(text: 'flutkit@coderthemes.com');
    passwordController = TextEditingController(text: 'password');
    fetchData();
  }

  fetchData() async {
    await NFTCache.initDummy();
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

  void goToRegisterScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }

  void goToForgotPasswordScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ForgotPasswordScreen(),
      ),
    );
  }

  void login() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => NFTFullApp(),
      ),
    );
  }

  @override
  String getTag() {
    return "shopping_login_controller";
  }
}
