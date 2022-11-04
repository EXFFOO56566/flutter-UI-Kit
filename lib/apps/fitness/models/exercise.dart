import 'package:flutkit/extensions/extensions.dart';

class Exercise {
  String name, duration, time;
  bool isRest;

  Exercise(this.name, this.duration, this.time, this.isRest);

  static Exercise fromJson(Map<String, dynamic> jsonObject) {
    String name = jsonObject['name'].toString();
    String duration = jsonObject['duration'].toString();
    String time = jsonObject['time'].toString();
    bool isRest = jsonObject['is_rest'].toString().toBool();

    return Exercise(name, duration, time, isRest);
  }

  static List<Exercise> getListFromJson(List<dynamic> jsonArray) {
    List<Exercise> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(Exercise.fromJson(jsonArray[i]));
    }
    return list;
  }
}
