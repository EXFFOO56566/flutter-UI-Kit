class Chat {
  final String image, name, chat, time, messages;
  final bool replied;

  Chat(
      this.image, this.name, this.chat, this.time, this.messages, this.replied);

  static List<Chat> chatList() {
    List<Chat> list = [];

    list.add(
      Chat('assets/images/profile/avatar_2.jpg', 'Dr. John Rodriguez',
          'Hello, how can i help you?', '14:22 am', '2', false),
    );
    list.add(
      Chat('assets/images/profile/avatar_1.jpg', 'Dr. Elizabeth Scott',
          'Thank you for visiting.', '05:25 pm', '2', true),
    );
    list.add(
      Chat('assets/images/profile/avatar_3.jpg', 'Dr. Miguel Johnson',
          'What are your requirements?', '12:32 am', '1', false),
    );
    list.add(
      Chat('assets/images/profile/avatar_4.jpg', 'Dr. Sarah Palson',
          'I want a 2 floored house.', '07:56 am', '2', true),
    );
    list.add(
      Chat('assets/images/profile/avatar_5.jpg', 'Dr. Anna Handy',
          'Hello, when will you be available?', '16:45 am', '2', true),
    );

    return list;
  }

  static Chat getOne() {
    return chatList().first;
  }
}
