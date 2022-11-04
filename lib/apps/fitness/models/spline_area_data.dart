import 'package:flutkit/extensions/extensions.dart';

class SplineAreaData {
  SplineAreaData(this.calories, this.day);

  final double calories;
  final double day;

  static SplineAreaData fromJson(Map<String, dynamic> jsonObject) {
    double calories = jsonObject['calories'].toString().toDouble() ?? 0;
    double day = jsonObject['day'].toString().toDouble() ?? 0;

    return SplineAreaData(calories, day);
  }

  static List<SplineAreaData> getListFromJson(List<dynamic> jsonArray) {
    List<SplineAreaData> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(SplineAreaData.fromJson(jsonArray[i]));
    }
    return list;
  }
}
