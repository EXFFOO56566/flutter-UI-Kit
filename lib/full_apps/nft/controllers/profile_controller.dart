import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ProfileController extends FxController {
  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
