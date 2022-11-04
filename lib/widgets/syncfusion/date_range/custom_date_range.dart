import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateRange extends StatefulWidget {
  const CustomDateRange({Key? key}) : super(key: key);

  @override
  _CustomDateRangeState createState() => _CustomDateRangeState();
}

class _CustomDateRangeState extends State<CustomDateRange> {
  late List<DateTime> _specialDates;

  @override
  void initState() {
    _specialDates = _getSpecialDates();
    super.initState();
  }

  List<DateTime> _getSpecialDates() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime startDate =
        DateTime.now().subtract(const Duration(days: 200));
    final DateTime endDate = DateTime.now().add(const Duration(days: 500));
    final Random random = Random();
    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 25))) {
      for (int i = 0; i < 3; i++) {
        dates.add(date.add(Duration(days: random.nextInt(i + 4))));
      }
    }

    return dates;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Widget _datePicker = Card(
      elevation: 10,
      margin: EdgeInsets.all(30),
      child: Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: _getCustomizedDatePicker(_specialDates, Theme.of(context))),
    );
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
            flex: 8,
            child: ListView(children: <Widget>[
              Container(height: 450, child: _datePicker)
            ])),
        Expanded(flex: 1, child: Container())
      ]),
    );
  }

  SfDateRangePicker _getCustomizedDatePicker(
      List<DateTime> specialDates, ThemeData theme) {
    final bool isDark = theme.brightness == Brightness.dark;

    final Color monthCellBackground =
        isDark ? const Color(0xFF232731) : const Color(0xfff7f4ff);
    final Color indicatorColor =
        isDark ? const Color(0xFF5CFFB7) : const Color(0xFF1AC4C7);
    final Color highlightColor =
        isDark ? const Color(0xFF5CFFB7) : Colors.deepPurpleAccent;
    final Color cellTextColor =
        isDark ? const Color(0xFFDFD4FF) : const Color(0xFF130438);

    return SfDateRangePicker(
      selectionShape: DateRangePickerSelectionShape.rectangle,
      selectionColor: highlightColor,
      selectionTextStyle:
          TextStyle(color: isDark ? Colors.black : Colors.white, fontSize: 14),
      minDate: DateTime.now().add(const Duration(days: -200)),
      maxDate: DateTime.now().add(const Duration(days: 500)),
      headerStyle: DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontSize: 18,
            color: cellTextColor,
          )),
      monthCellStyle: DateRangePickerMonthCellStyle(
          cellDecoration: _MonthCellDecoration(
              borderColor: null,
              backgroundColor: monthCellBackground,
              showIndicator: false,
              indicatorColor: indicatorColor),
          todayCellDecoration: _MonthCellDecoration(
              borderColor: highlightColor,
              backgroundColor: monthCellBackground,
              showIndicator: false,
              indicatorColor: indicatorColor),
          specialDatesDecoration: _MonthCellDecoration(
              borderColor: null,
              backgroundColor: monthCellBackground,
              showIndicator: true,
              indicatorColor: indicatorColor),
          disabledDatesTextStyle: TextStyle(
            color: isDark ? const Color(0xFF666479) : const Color(0xffe2d7fe),
          ),
          weekendTextStyle: TextStyle(
            color: highlightColor,
          ),
          textStyle: TextStyle(color: cellTextColor, fontSize: 14),
          specialDatesTextStyle: TextStyle(color: cellTextColor, fontSize: 14),
          todayTextStyle: TextStyle(color: highlightColor, fontSize: 14)),
      yearCellStyle: DateRangePickerYearCellStyle(
        todayTextStyle: TextStyle(color: highlightColor, fontSize: 14),
        textStyle: TextStyle(color: cellTextColor, fontSize: 14),
        disabledDatesTextStyle: TextStyle(
            color: isDark ? const Color(0xFF666479) : const Color(0xffe2d7fe)),
        leadingDatesTextStyle:
            TextStyle(color: cellTextColor.withOpacity(0.5), fontSize: 14),
      ),
      showNavigationArrow: true,
      todayHighlightColor: highlightColor,
      monthViewSettings: DateRangePickerMonthViewSettings(
        firstDayOfWeek: 1,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
            textStyle: TextStyle(
                fontSize: 10,
                color: cellTextColor,
                fontWeight: FontWeight.w600)),
        dayFormat: 'EEE',
        showTrailingAndLeadingDates: false,
        specialDates: specialDates,
      ),
    );
  }
}

class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        showIndicator: showIndicator,
        indicatorColor: indicatorColor);
  }
}

class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    canvas.drawRRect(
        RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    if (borderColor != null) {
      paint.color = borderColor!;
      canvas.drawRRect(
          RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    }

    if (showIndicator) {
      paint.color = indicatorColor!;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(bounds.right - 6, bounds.top + 6), 2.5, paint);
    }
  }
}
