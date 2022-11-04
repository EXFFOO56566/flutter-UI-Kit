import 'package:flutkit/m3/cookify/views/full_app.dart';
import 'package:flutkit/m3/cookify/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ForgotPasswordController extends FxController {
  late TextEditingController emailTE;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    this.emailTE = TextEditingController(text: 'flutkit@coderthemes.com');
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  void forgotPassword() {
    if (formKey.currentState!.validate())
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FullApp(),
        ),
      );
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
    return "forgot_password_controller";
  }
}
