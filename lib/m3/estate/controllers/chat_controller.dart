import 'package:flutkit/m3/estate/views/single_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/chat.dart';

class ChatController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Chat>? chats;

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    chats = await Chat.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleChatScreen(Chat chat) {
    Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => SingleChatScreen(chat)));
  }

  @override
  String getTag() {
    return "chat_controller";
  }
}
