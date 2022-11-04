import 'package:flutkit/m3/estate/views/single_estate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/agent.dart';
import '../models/house.dart';

class SingleAgentController extends FxController {
  bool showLoading = true, uiLoading = true;

  List<House>? houses;
  late Agent agent;

  SingleAgentController(this.agent);

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    houses = await House.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleHouseScreen(House house) {
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => SingleEstateScreen(house)));
  }

  @override
  String getTag() {
    return "single_agent_controller";
  }
}
