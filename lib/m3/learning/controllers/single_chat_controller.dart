import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/chat.dart';
import '../models/message.dart';

class SingleChatController extends FxController {
  bool showLoading = false, uiLoading = false;

  late Chat chat;

  SingleChatController(this.chat);

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  bool fromMentor(Message message) {
    return message.from.compareTo('mentor') == 0;
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "single_chat_controller";
  }
}
