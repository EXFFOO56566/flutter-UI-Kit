import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/splash_screen2.dart';

class ResetPasswordController extends FxController {
  TickerProvider ticker;
  ResetPasswordController(this.ticker);
  late TextEditingController confirmPasswordTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController arrowController,
      passwordController,
      resetPasswordController;
  late Animation<Offset> arrowAnimation,
      passwordAnimation,
      resetPasswordAnimation;
  int passwordCounter = 0;
  int resetPasswordCounter = 0;

  @override
  void initState() {
    super.initState();
    confirmPasswordTE = TextEditingController(text: 'password123');
    passwordTE = TextEditingController(text: 'password');
    arrowController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 500));
    passwordController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));
    resetPasswordController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));

    arrowAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(8, 0))
        .animate(CurvedAnimation(
      parent: arrowController,
      curve: Curves.easeIn,
    ));
    passwordAnimation =
        Tween<Offset>(begin: Offset(-0.01, 0), end: Offset(0.01, 0))
            .animate(CurvedAnimation(
      parent: passwordController,
      curve: Curves.easeIn,
    ));
    resetPasswordAnimation =
        Tween<Offset>(begin: Offset(-0.01, 0), end: Offset(0.01, 0))
            .animate(CurvedAnimation(
      parent: resetPasswordController,
      curve: Curves.easeIn,
    ));

    passwordController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        passwordController.reverse();
      }
      if (status == AnimationStatus.dismissed && passwordCounter < 2) {
        passwordController.forward();
        passwordCounter++;
      }
    });
    resetPasswordController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        resetPasswordController.reverse();
      }
      if (status == AnimationStatus.dismissed && resetPasswordCounter < 2) {
        resetPasswordController.forward();
        resetPasswordCounter++;
      }
    });
  }

  @override
  void dispose() {
    arrowController.dispose();
    passwordController.dispose();
    resetPasswordController.dispose();
    super.dispose();
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      passwordController.forward();
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      passwordController.forward();
      return "Password length must between 8 and 20";
    }
    return null;
  }

  String? validateConfirmPassword(String? text) {
    if (text == null || text.isEmpty) {
      resetPasswordController.forward();
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      resetPasswordController.forward();
      return "Password length must between 8 and 20";
    } else if (passwordTE.text != text) {
      resetPasswordController.forward();
      return "Both passwords are not same";
    }
    return null;
  }

  Future<void> resetPassword() async {
    resetPasswordCounter = 0;
    if (formKey.currentState!.validate()) {
      arrowController.forward();
      await Future.delayed(Duration(milliseconds: 500));
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen2(),
        ),
      );
    }
  }

  @override
  String getTag() {
    return "reset_password_controller";
  }
}
