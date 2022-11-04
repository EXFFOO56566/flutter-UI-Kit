import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/agent.dart';
import '../models/chat.dart';
import '../models/house.dart';
import '../views/single_chat_screen.dart';

class EstateSingleAgentController extends FxController {
  bool showLoading = true, uiLoading = true;

  List<House>? houses;
  late Agent agent;

  EstateSingleAgentController(this.agent);

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    houses = House.houseList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToAgentChat() {
    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => EstateSingleChatScreen(Chat.getOne())));
  }

  @override
  String getTag() {
    return "single_agent_controller";
  }
}
