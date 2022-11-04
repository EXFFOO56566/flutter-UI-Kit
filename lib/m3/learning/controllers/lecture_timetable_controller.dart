import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/lecture.dart';

class LectureTimeTableController extends FxController {
  bool uiLoading = true;

  List<Lecture>? lectures;
  late MeetingDataSource events;
  final CalendarController calendarController = CalendarController();

  late DateTime minDate, maxDate;

  @override
  void initState() {
    super.initState();
    calendarController.selectedDate = DateTime.now();
    fetchData();
  }

  void goBack() {
    Navigator.pop(context);
  }

  fetchData() async {
    lectures = await Lecture.getDummyList();
    minDate = lectures![0].endTime;
    maxDate = lectures![lectures!.length - 1].endTime;
    events = MeetingDataSource(lectures!);
    await Future.delayed(Duration(seconds: 1));
    uiLoading = false;
    update();
  }

  void onViewChanged(ViewChangedDetails visibleDatesChangedDetails) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      final DateTime currentViewDate = visibleDatesChangedDetails
          .visibleDates[visibleDatesChangedDetails.visibleDates.length ~/ 2];

      if (currentViewDate.month == DateTime.now().month &&
          currentViewDate.year == DateTime.now().year) {
        calendarController.selectedDate = DateTime.now();
      } else {
        calendarController.selectedDate =
            DateTime(currentViewDate.year, currentViewDate.month, 01);
      }
    });
  }

  @override
  String getTag() {
    return "lecture_time_table_controller";
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(this.source);

  List<Lecture> source;

  @override
  List<Lecture> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].endTime;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }

  @override
  String getSubject(int index) {
    return source[index].subject;
  }

  @override
  String? getStartTimeZone(int index) {
    return '';
  }

  @override
  String? getEndTimeZone(int index) {
    return '';
  }

  @override
  Color getColor(int index) {
    return source[index].color;
  }

  @override
  String? getRecurrenceRule(int index) {
    return '';
  }
}

class Meeting {
  Meeting(
      this.eventName,
      this.organizer,
      this.contactID,
      this.capacity,
      this.from,
      this.to,
      this.background,
      this.isAllDay,
      this.startTimeZone,
      this.endTimeZone,
      this.recurrenceRule);

  String eventName;
  String? organizer;
  String? contactID;
  int? capacity;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? startTimeZone;
  String? endTimeZone;
  String? recurrenceRule;
}
