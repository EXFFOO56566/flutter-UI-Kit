import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class EstateRegisterController extends FxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  String getTag() {
    return "register_controller";
  }
}
