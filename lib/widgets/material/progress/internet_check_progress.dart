/*
* File : Internet Check
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class InternetProgress extends StatefulWidget {
  @override
  _InternetCheckWidgetState createState() => _InternetCheckWidgetState();
}

class _InternetCheckWidgetState extends State<InternetProgress>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    startTimer();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    const oneSec = const Duration(seconds: 2);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              setState(
                () {
                  isInProgress = false;
                },
              )
            });
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _InternetCheckDialog();
        });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: isInProgress
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      )),
                      FxSpacing.width(20),
                      FxText.bodyMedium("Checking...",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.2)
                    ],
                  )
                : FxButton(
                    backgroundColor: theme.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      startTimer();
                    },
                    child: FxText.bodyMedium("Check",
                        color: theme.colorScheme.onPrimary))));
  }
}

class _InternetCheckDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: FxSpacing.xy(24, 16),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                  child: Icon(
                Icons.signal_wifi_off_outlined,
                size: 40,
                color: themeData.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.titleMedium("No Internet!", fontWeight: 700)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.bodySmall("Please turn on internet",
                      fontWeight: 500)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                child: FxButton(
                    backgroundColor: themeData.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: FxText.bodySmall("TRY AGAIN",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: themeData.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
