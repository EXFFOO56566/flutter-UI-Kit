class Slot {
  final String time;

  Slot(this.time);

  static List<String> morningList() {
    List<String> list = [];

    list.add('10:10 am');
    list.add('10:30 am');
    list.add('10:50 am');
    list.add('11:20 am');
    list.add('11:40 am');

    return list;
  }

  static List<String> afternoonList() {
    List<String> list = [];

    list.add('02:00 am');
    list.add('02:20 am');
    list.add('02:40 am');
    return list;
  }

  static List<String> eveningList() {
    List<String> list = [];

    list.add('07:00 am');
    list.add('07:20 am');
    list.add('07:40 am');
    list.add('08:00 am');
    list.add('08:20 am');
    return list;
  }
}
