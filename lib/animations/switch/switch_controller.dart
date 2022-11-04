import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class SwitchController extends FxController {
  SwitchController();

  String status = "Off";
  bool toggleValue = false;

  @override
  void initState() {
    super.initState();
  }

  void onClick() {
    if (status.compareTo("Off") == 0) {
      status = "On";
      update();
    } else {
      status = "Off";
      update();
    }
  }

  void goBack() {
    Navigator.pop(context);
  }

  toggleButton() {
    toggleValue = !toggleValue;
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  String getTag() {
    return "animation_switch_controller";
  }
}
