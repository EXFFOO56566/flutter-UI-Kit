class DateTime {
  final String date, day;

  DateTime(this.date, this.day);

  static List<DateTime> dummyList() {
    List<DateTime> list = [];

    list.add(DateTime("01", "Sun"));
    list.add(DateTime("02", "Mon"));
    list.add(DateTime("03", "Tue"));
    list.add(DateTime("04", "Wed"));
    list.add(DateTime("05", "Thu"));
    list.add(DateTime("06", "Fri"));
    list.add(DateTime("07", "Sat"));
    list.add(DateTime("08", "Sun"));
    list.add(DateTime("09", "Mon"));
    list.add(DateTime("10", "Tue"));

    return list;
  }
}
