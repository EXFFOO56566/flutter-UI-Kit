import 'package:flutkit/full_apps/shopping/views/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/forgot_password_screen.dart';
import '../views/register_screen.dart';

class LogInController extends FxController {
  TickerProvider ticker;
  LogInController(this.ticker);
  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController arrowController, emailController, passwordController;
  late Animation<Offset> arrowAnimation, emailAnimation, passwordAnimation;
  int emailCounter = 0;
  int passwordCounter = 0;

  @override
  void initState() {
    super.initState();
    emailTE = TextEditingController(text: 'flutkit@coderthemes.com');
    passwordTE = TextEditingController(text: 'password');
    arrowController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 500));
    emailController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));
    passwordController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));

    arrowAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(8, 0))
        .animate(CurvedAnimation(
      parent: arrowController,
      curve: Curves.easeIn,
    ));
    emailAnimation =
        Tween<Offset>(begin: Offset(-0.01, 0), end: Offset(0.01, 0))
            .animate(CurvedAnimation(
      parent: emailController,
      curve: Curves.easeIn,
    ));
    passwordAnimation =
        Tween<Offset>(begin: Offset(-0.01, 0), end: Offset(0.01, 0))
            .animate(CurvedAnimation(
      parent: passwordController,
      curve: Curves.easeIn,
    ));

    emailController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        emailController.reverse();
      }
      if (status == AnimationStatus.dismissed && emailCounter < 2) {
        emailController.forward();
        emailCounter++;
      }
    });

    passwordController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        passwordController.reverse();
      }
      if (status == AnimationStatus.dismissed && passwordCounter < 2) {
        passwordController.forward();
        passwordCounter++;
      }
    });
  }

  @override
  void dispose() {
    arrowController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      emailController.forward();
      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {
      emailController.forward();

      return "Please enter valid email";
    }
    return null;
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

  void goToForgotPasswordScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ForgotPasswordScreen(),
      ),
    );
  }

  Future<void> login() async {
    emailCounter = 0;
    passwordCounter = 0;
    if (formKey.currentState!.validate()) {
      arrowController.forward();
      await Future.delayed(Duration(milliseconds: 1000));
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen2(),
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
    return "login_controller";
  }
}
