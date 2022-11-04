import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class VerticalDateRange extends StatefulWidget {
  const VerticalDateRange({Key? key}) : super(key: key);

  @override
  _VerticalDateRangeState createState() => _VerticalDateRangeState();
}

class _VerticalDateRangeState extends State<VerticalDateRange> {
  DateRangePickerNavigationMode _navigationMode =
      DateRangePickerNavigationMode.scroll;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Widget calendar = Container(
      height: 550,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Theme(
        data: Theme.of(context),
        child: _getVerticalCalendar(),
      ),
    );
    final Widget _cardView = Card(
        elevation: 10,
        margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
        child: calendar);
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
          flex: 9,
          child: ListView(children: <Widget>[
            Container(
              height: 590,
              child: _cardView,
            )
          ]))
    ]));
  }

  SfDateRangePicker _getVerticalCalendar() {
    return SfDateRangePicker(
      enableMultiView: true,
      headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: Theme.of(context).cardTheme.color),
      navigationDirection: DateRangePickerNavigationDirection.vertical,
      selectionMode: DateRangePickerSelectionMode.multiRange,
      monthViewSettings:
          const DateRangePickerMonthViewSettings(enableSwipeSelection: false),
      showNavigationArrow: false,
      navigationMode: _navigationMode,
    );
  }
}
