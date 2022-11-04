import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/chat.dart';
import '../models/message.dart';
import '../views/single_chat_screen.dart';

class ChatController extends FxController {
  bool showLoading = true, uiLoading = true;
  List<Chat>? chats;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    chats = await Chat.getDummyList();
    showLoading = false;
    uiLoading = false;
    update();
  }

  int notSeenMessages(List<Message> messages) {
    int count = 0;
    for (int i = messages.length - 1; i > 0; i--) {
      if (messages[i].from.compareTo('mentor') == 0 &&
          messages[i].status.compareTo('seen') != 0) {
        count++;
      }
    }
    return count;
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
