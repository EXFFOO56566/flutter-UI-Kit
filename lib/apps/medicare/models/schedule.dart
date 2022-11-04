import 'dart:core';

class Schedule {
  final String month, event, doctorName, time;
  final int date;

  Schedule(this.month, this.event, this.doctorName, this.time, this.date);

  static List<Schedule> upComingList() {
    List<Schedule> list = [];
    list.add(Schedule(
        'Jul', 'Diagnostic Heart', 'Dr. Harriett Myers', '01:05 PM', 11));
    list.add(
        Schedule('Aug', 'Brain Checkup', 'Dr. Michael Rica', '12:55 AM', 24));

    return list;
  }

  static List<Schedule> completedList() {
    List<Schedule> list = [];
    list.add(Schedule(
        'Mar', 'Nutrition Consult', 'Dr. Mollie Barber', '07:45 PM', 03));
    list.add(Schedule(
        'Feb', 'Diagnostic Corona', 'Dr. Jean Estrada', '04:25 PM', 16));
    list.add(Schedule('Jan', 'Pet CheckUp', 'Dr. Joe Mellon', '07:55 PM', 27));

    return list;
  }
}
