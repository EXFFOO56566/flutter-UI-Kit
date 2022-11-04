/*
* File : Internet Check
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InternetCheckProgressWidget extends StatefulWidget {
  @override
  _InternetCheckWidgetState createState() => _InternetCheckWidgetState();
}

class _InternetCheckWidgetState extends State<InternetCheckProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("No Internet", fontWeight: 600),
        ),
        body: Center(
            child: isInProgress
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      )),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: FxText.bodyMedium("Checking...",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.2),
                      )
                    ],
                  )
                : FxButton(
                    elevation: 2,
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
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
        decoration: new BoxDecoration(
          color: theme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
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
                MdiIcons.wifiOff,
                size: 40,
                color: theme.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.titleMedium("No Internet!", fontWeight: 700)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.bodySmall("Please turn on internet",
                      fontWeight: 500)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: FxButton(
                    elevation: 2,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: FxText.bodySmall("TRY AGAIN",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: theme.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
