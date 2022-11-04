import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/reset_password_screen.dart';

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

  void goToResetPasswordScreen() {
    if (formKey.currentState!.validate())
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        ),
      );
  }

  @override
  String getTag() {
    return "forgot_password_controller";
  }
}
