import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/splash_screen2.dart';
import '../views/login_screen.dart';

class RegisterController extends FxController {
  TickerProvider ticker;
  RegisterController(this.ticker);
  late TextEditingController nameTE, emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late AnimationController arrowController,
      nameController,
      emailController,
      passwordController;
  late Animation<Offset> arrowAnimation,
      nameAnimation,
      emailAnimation,
      passwordAnimation;
  int nameCounter = 0;
  int emailCounter = 0;
  int passwordCounter = 0;

  @override
  void initState() {
    super.initState();
    nameTE = TextEditingController();
    emailTE = TextEditingController();
    passwordTE = TextEditingController();

    arrowController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 500));
    nameController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));
    emailController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));
    passwordController = AnimationController(
        vsync: ticker, duration: Duration(milliseconds: 50));

    arrowAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(8, 0))
        .animate(CurvedAnimation(
      parent: arrowController,
      curve: Curves.easeIn,
    ));
    nameAnimation = Tween<Offset>(begin: Offset(-0.01, 0), end: Offset(0.01, 0))
        .animate(CurvedAnimation(
      parent: nameController,
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

    nameController.addStatusListener((status) {
      log(status.toString());
      if (status == AnimationStatus.completed) {
        nameController.reverse();
      }
      if (status == AnimationStatus.dismissed && nameCounter < 2) {
        nameController.forward();
        nameCounter++;
      }
    });
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

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      nameController.forward();
      return "Please enter name";
    } else if (!FxStringValidator.validateStringRange(text, 4, 20)) {
      nameController.forward();
      return "Password length must between 4 and 20";
    }
    return null;
  }

  @override
  void dispose() {
    arrowController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    passwordCounter = 0;
    nameCounter = 0;
    emailCounter = 0;
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

  void goToLogInScreen() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
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
