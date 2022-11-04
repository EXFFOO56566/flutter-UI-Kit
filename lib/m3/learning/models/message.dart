class Message {
  String text, time, from, status;

  Message(this.text, this.time, this.from, this.status);

  static Message fromJson(Map<String, dynamic> jsonObject) {
    String text = jsonObject['text'].toString();
    String time = jsonObject['time'].toString();
    String from = jsonObject['from'].toString();
    String status = jsonObject['status'].toString();

    return Message(text, time, from, status);
  }

  static List<Message> getListFromJson(List<dynamic> jsonArray) {
    List<Message> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Message.fromJson(jsonArray[i]));
    }
    return list;
  }
}
