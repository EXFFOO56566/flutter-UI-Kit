import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/register_screen.dart';
import '../views/reset_password_screen.dart';

class ForgotPasswordController extends FxController {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: 'flutkit@coderthemes.com');
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
    if (formKey.currentState!.validate()) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
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
    return "forgot_password_controller";
  }
}
