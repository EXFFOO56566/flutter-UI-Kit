import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutkit/extensions/extensions.dart';

class Chat {
  final String name, image, chat, time, messages;
  final bool replied;

  Chat(
      this.name, this.image, this.chat, this.time, this.messages, this.replied);

  static Future<List<Chat>> getDummyList() async {
    dynamic data = json.decode(await getData());
    return getListFromJson(data);
  }

  static Future<Chat> getOne() async {
    return (await getDummyList())[0];
  }

  static Chat fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String image = jsonObject['image'].toString();
    String chat = jsonObject['chat'].toString();
    String time = jsonObject['time'].toString();
    String messages = jsonObject['messages'].toString();
    bool replied = jsonObject['replied'].toString().toBool();

    return Chat(name, image, chat, time, messages, replied);
  }

  static List<Chat> getListFromJson(List<dynamic> jsonArray) {
    List<Chat> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Chat.fromJson(jsonArray[i]));
    }
    return list;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('lib/m3/estate/data/chats.json');
  }

  static Chat getOneDummy() {
    return Chat('Dr. Anna Handy', 'assets/images/profile/avatar_5.jpg',
        'Hello, when will you be available?', '16:45 am', '2', true);
  }
}
