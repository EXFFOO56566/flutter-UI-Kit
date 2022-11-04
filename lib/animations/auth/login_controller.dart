import 'package:flutkit/utils/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'teddy_controller.dart';

class LogInController extends FxController {
  LogInController();

  late TextEditingController emailTE, passwordTE;
  GlobalKey<FormState> formKey = GlobalKey();
  late TeddyController teddyController;
  late final FocusNode emailNode, passwordNode;

  @override
  void initState() {
    super.initState();
    emailTE = TextEditingController(text: 'flutkit@coderthemes.com');
    passwordTE = TextEditingController(text: 'password');
    teddyController = TeddyController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    initFocusNode();
  }

  initFocusNode() {
    emailNode.addListener(() {
      if (emailNode.hasFocus) {
        teddyController.coverEyes(false);
      }
    });
    passwordNode.addListener(() {
      if (passwordNode.hasFocus) {
        teddyController.coverEyes(true);
      }
    });
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {
      return "Password length must between 8 and 20";
    }
    return null;
  }

  void onCaretMoved(Offset? offset) {
    teddyController.lookAt(offset);
  }

  void login() {
    if (formKey.currentState!.validate()) {
      // teddyController.coverEyes(false);
      teddyController.setSuccess();
      Info.message("Login success", context: context);
    } else {
      teddyController.setFail();
      Info.error("Login failed", context: context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  String getTag() {
    return "animation_auth_login_controller";
  }
}
