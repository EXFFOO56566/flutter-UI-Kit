import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/full_app.dart';

class ForgotPasswordController extends FxController {
  bool showLoading = true, uiLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void forgotPassword() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FullApp()));
  }

  @override
  String getTag() {
    return "forgot_password_controller";
  }
}
