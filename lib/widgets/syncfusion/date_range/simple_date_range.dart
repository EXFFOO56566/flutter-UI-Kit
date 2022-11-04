import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SimpleDateRange extends StatefulWidget {
  const SimpleDateRange({Key? key}) : super(key: key);

  @override
  _SimpleDateRangeState createState() => _SimpleDateRangeState();
}

class _SimpleDateRangeState extends State<SimpleDateRange> {
  final DateRangePickerController _controller = DateRangePickerController();
  DateRangePickerSelectionMode _selectionMode =
      DateRangePickerSelectionMode.extendableRange;
  bool _showTrailingAndLeadingDates = false;
  bool _enablePastDates = true;
  bool _enableSwipingSelection = true;
  bool _enableViewNavigation = true;
  bool _showActionButtons = true;
  bool _isWeb = false;
  bool _showWeekNumber = false;

  @override
  void initState() {
    _controller.view = DateRangePickerView.month;
    _controller.displayDate = DateTime.now();
    _controller.selectedDate = DateTime.now();
    _controller.selectedDates = <DateTime>[
      DateTime.now(),
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().subtract(const Duration(days: 2))
    ];
    _controller.selectedRange = PickerDateRange(
        DateTime.now().subtract(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 2)));
    _controller.selectedRanges = <PickerDateRange>[
      PickerDateRange(DateTime.now().subtract(const Duration(days: 2)),
          DateTime.now().add(const Duration(days: 2))),
      PickerDateRange(DateTime.now().add(const Duration(days: 8)),
          DateTime.now().add(const Duration(days: 12))),
      PickerDateRange(DateTime.now().add(const Duration(days: 15)),
          DateTime.now().add(const Duration(days: 20))),
      PickerDateRange(DateTime.now().add(const Duration(days: 22)),
          DateTime.now().add(const Duration(days: 27)))
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _isWeb = MediaQuery.of(context).size.width > 767;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool _enableMultiView = _isWeb &&
        (_selectionMode == DateRangePickerSelectionMode.range ||
            _selectionMode == DateRangePickerSelectionMode.multiRange ||
            _selectionMode == DateRangePickerSelectionMode.extendableRange);
    final Widget cardView = Card(
        elevation: 10,
        margin: EdgeInsets.all(30),
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Theme(
              data: Theme.of(context),
              child: _getGettingStartedDatePicker(
                  _controller,
                  _selectionMode,
                  _showTrailingAndLeadingDates,
                  _enablePastDates,
                  _enableSwipingSelection,
                  _enableViewNavigation,
                  _showActionButtons,
                  DateTime.now().subtract(const Duration(days: 200)),
                  DateTime.now().add(const Duration(days: 200)),
                  _enableMultiView,
                  _showWeekNumber,
                  context)),
        ));
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? null
          : const Color(0x00171a21),
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
      ]),
    );
  }

  void onPickerViewChange(String value) {
    if (value == 'month') {
      _controller.view = DateRangePickerView.month;
    } else if (value == 'year') {
      _controller.view = DateRangePickerView.year;
    } else if (value == 'decade') {
      _controller.view = DateRangePickerView.decade;
    } else if (value == 'century') {
      _controller.view = DateRangePickerView.century;
    }
    setState(() {});
  }

  void onSelectionModeChange(String value) {
    if (value == 'single') {
      _selectionMode = DateRangePickerSelectionMode.single;
    } else if (value == 'multiple') {
      _selectionMode = DateRangePickerSelectionMode.multiple;
    } else if (value == 'range') {
      _selectionMode = DateRangePickerSelectionMode.range;
    } else if (value == 'multiRange') {
      _selectionMode = DateRangePickerSelectionMode.multiRange;
    } else if (value == 'extendableRange') {
      _selectionMode = DateRangePickerSelectionMode.extendableRange;
    }
    setState(() {});
  }

  void onBoolValueChange(String property, bool value) {
    if (property == 'ShowLeadingTrailingDates') {
      _showTrailingAndLeadingDates = value;
    } else if (property == 'EnablePastDates') {
      _enablePastDates = value;
    } else if (property == 'EnableSwipingSelection') {
      _enableSwipingSelection = value;
    } else if (property == 'EnableViewNavigation') {
      _enableViewNavigation = value;
    } else if (property == 'ShowActionButtons') {
      _showActionButtons = value;
    } else if (property == 'ShowWeekNumber') {
      _showWeekNumber = value;
    }
    setState(() {});
  }
}

SfDateRangePicker _getGettingStartedDatePicker(
    DateRangePickerController controller,
    DateRangePickerSelectionMode mode,
    bool showLeading,
    bool enablePastDates,
    bool enableSwipingSelection,
    bool enableViewNavigation,
    bool showActionButtons,
    DateTime minDate,
    DateTime maxDate,
    bool enableMultiView,
    bool showWeekNumber,
    BuildContext context) {
  return SfDateRangePicker(
    enablePastDates: enablePastDates,
    minDate: minDate,
    maxDate: maxDate,
    enableMultiView: enableMultiView,
    allowViewNavigation: enableViewNavigation,
    showActionButtons: showActionButtons,
    selectionMode: mode,
    controller: controller,
    headerStyle: DateRangePickerHeaderStyle(
        textAlign: enableMultiView ? TextAlign.center : TextAlign.left),
    onCancel: () {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Selection Cancelled',
        ),
        duration: Duration(milliseconds: 200),
      ));
    },
    onSubmit: (Object? value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Selection Confirmed',
        ),
        duration: Duration(milliseconds: 200),
      ));
    },
    monthViewSettings: DateRangePickerMonthViewSettings(
        enableSwipeSelection: enableSwipingSelection,
        showTrailingAndLeadingDates: showLeading,
        showWeekNumber: showWeekNumber),
  );
}
