/*
* File : Date Picker
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreenState createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        showSnackBarWithFloating(picked.day.toString() +
            " - " +
            picked.month.toString() +
            " - " +
            picked.year.toString());
      });
  }

  _pickTime12(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime!);
    if (t != null)
      setState(() {
        selectedTime = t;
      });

    showSnackBarWithFloating(selectedTime!.format(context));
  }

  _pickTime24(BuildContext context) async {
    TimeOfDay? t = await showTimePicker(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
        context: context,
        initialTime: selectedTime!);
    if (t != null)
      setState(() {
        selectedTime = t;
        String time = "";
        if (t.hour < 10) {
          time = time + "0" + t.hour.toString();
        } else {
          time = time + t.hour.toString();
        }
        time = time + " : ";
        if (t.minute < 10) {
          time = time + "0" + t.minute.toString();
        } else {
          time = time + t.minute.toString();
        }
        showSnackBarWithFloating(time);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: FxButton(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: () {
              _pickDate(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  FeatherIcons.calendar,
                  color: theme.colorScheme.onPrimary,
                  size: 22,
                ),
                FxSpacing.width(8),
                FxText.bodyMedium("Select Date",
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary,
                    letterSpacing: 0.3),
              ],
            ),
          ),
        ),
        FxSpacing.height(24),
        Center(
          child: FxButton(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: () {
              _pickTime12(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  FeatherIcons.clock,
                  color: theme.colorScheme.onPrimary,
                  size: 22,
                ),
                FxSpacing.width(8),
                FxText.bodyMedium("12 HOUR",
                    fontWeight: 600,
                    letterSpacing: 0.4,
                    color: theme.colorScheme.onPrimary),
              ],
            ),
          ),
        ),
        FxSpacing.height(24),
        FxButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () {
            _pickTime24(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                FeatherIcons.clock,
                color: theme.colorScheme.onPrimary,
                size: 22,
              ),
              FxSpacing.width(8),
              FxText.bodyMedium("24 HOUR",
                  fontWeight: 600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.onPrimary),
            ],
          ),
        ),
      ],
    ));
  }

  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.subtitle2!
              .merge(TextStyle(color: theme.colorScheme.onPrimary)),
        ),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
