/*
* File : Time Picker
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  late TimeOfDay selectedTime;

  _pickTime12(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null)
      setState(() {
        selectedTime = t;
        showSnackbarWithFloating(t.format(context));
      });
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
        initialTime: selectedTime);
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
        showSnackbarWithFloating(time);
      });
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();

    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Time Picker", fontWeight: 600),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FxButton(
                elevation: 2,
                borderRadiusAll: 4,
                onPressed: () {
                  _pickTime12(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      MdiIcons.clockOutline,
                      color: theme.colorScheme.onPrimary,
                      size: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FxText.bodyMedium("12 HOUR",
                          fontWeight: 600,
                          letterSpacing: 0.4,
                          color: theme.colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: FxButton(
                  elevation: 2,
                  borderRadiusAll: 4,
                  onPressed: () {
                    _pickTime24(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        MdiIcons.clockOutline,
                        color: theme.colorScheme.onPrimary,
                        size: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: FxText.bodyMedium("24 HOUR",
                            fontWeight: 600,
                            letterSpacing: 0.4,
                            color: theme.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
