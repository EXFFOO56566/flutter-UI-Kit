import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'house_controller.dart';

class ResizingHouseController extends FxController {
  int rooms = 6;
  late HouseController houseController;
  Timer? _currentDemoSchedule;

  ResizingHouseController() {
    houseController = HouseController(
      demoUpdated: update,
    );
  }

  void onSliderChange(double value) {
    houseController.isDemoMode = false;
    rooms = value.toInt() + 3;

    houseController.rooms = rooms;

    if (_currentDemoSchedule != null) {
      _currentDemoSchedule!.cancel();
      _currentDemoSchedule = null;
    }
    update();
  }

  @override
  void initState() {
    super.initState();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  String getTag() {
    return "animation_resizing_house_controller";
  }
}
