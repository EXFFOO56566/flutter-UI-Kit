import 'package:flutkit/m3/estate/models/agent.dart';
import 'package:flutkit/m3/estate/views/single_agent_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/house.dart';

class SingleEstateController extends FxController {
  bool showLoading = true, uiLoading = true;
  late House house;

  SingleEstateController(this.house);

  @override
  initState() {
    super.save = false;
    super.initState();
    getHouse();
  }

  getHouse() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleAgentScreen(Agent agent) {
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => SingleAgentScreen(agent)));
  }

  @override
  String getTag() {
    return "single_estate_controller";
  }
}
