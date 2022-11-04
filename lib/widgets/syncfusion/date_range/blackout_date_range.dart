import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BlackoutDateRange extends StatefulWidget {
  const BlackoutDateRange({Key? key}) : super(key: key);

  @override
  _BlackoutDateRangeState createState() => _BlackoutDateRangeState();
}

class _BlackoutDateRangeState extends State<BlackoutDateRange> {
  late List<DateTime> _blackoutDates;

  @override
  void initState() {
    _blackoutDates = _getBlackoutDates();
    super.initState();
  }

  List<DateTime> _getBlackoutDates() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime startDate =
        DateTime.now().subtract(const Duration(days: 500));
    final DateTime endDate = DateTime.now().add(const Duration(days: 500));
    final Random random = Random();
    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(Duration(days: random.nextInt(25)))) {
      dates.add(date);
    }

    return dates;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Widget cardView = Card(
      elevation: 10,
      margin: const EdgeInsets.all(30),
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
        child: Theme(data: Theme.of(context), child: _getBlackoutDatePicker()),
      ),
    );
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
          flex: 8,
          child: ListView(children: <Widget>[
            Container(
              height: 450,
              child: cardView,
            )
          ])),
      Expanded(flex: 1, child: Container())
    ]));
  }

  SfDateRangePicker _getBlackoutDatePicker() {
    return SfDateRangePicker(
        monthCellStyle: const DateRangePickerMonthCellStyle(
            blackoutDateTextStyle: TextStyle(
                color: Colors.red, decoration: TextDecoration.lineThrough)),
        monthViewSettings: DateRangePickerMonthViewSettings(
            showTrailingAndLeadingDates: true, blackoutDates: _blackoutDates),
        showNavigationArrow: false);
  }
}
