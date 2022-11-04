import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

class Chat {
  final String name, url, chat, time, messages;
  final bool replied, active;

  Chat(this.name, this.url, this.chat, this.time, this.messages, this.replied,
      this.active);

  static Future<List<Chat>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Chat> getOne() async {
    return (await getDummyList())[0];
  }

  static Chat fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String url = jsonObject['url'].toString();
    String chat = jsonObject['chat'].toString();
    String time = jsonObject['time'].toString();
    String messages = jsonObject['messages'].toString();
    bool replied = stringToBool(jsonObject['replied'].toString());

    return Chat(name, url, chat, time, messages, replied, Random().nextBool());
  }

  static stringToBool(String value) {
    return value == 'true' ? true : false;
  }

  static List<Chat> getListFromJson(List<dynamic> jsonArray) {
    List<Chat> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Chat.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/apps/homemade/data/chats.json');
  }

  @override
  String toString() {
    return 'Chat{name: $name, url: $url, chat: $chat, time: $time, messages: $messages, replied: $replied}';
  }
}
