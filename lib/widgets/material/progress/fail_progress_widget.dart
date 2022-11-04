/*
* File : Fail Progress
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../theme/app_theme.dart';

class FailProgressWidget extends StatefulWidget {
  @override
  _FailProgressWidgetState createState() => _FailProgressWidgetState();
}

class _FailProgressWidgetState extends State<FailProgressWidget>
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
          return _FailDialog();
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
          title: FxText.titleMedium("Try Again", fontWeight: 600),
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
                        child: FxText.bodyMedium("Trying...",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.2),
                      )
                    ],
                  )
                : FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      startTimer();
                    },
                    child: FxText.bodyMedium("Try This",
                        color: theme.colorScheme.onPrimary))));
  }
}

class _FailDialog extends StatelessWidget {
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
                MdiIcons.emoticonSadOutline,
                size: 40,
                color: theme.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child:
                  Center(child: FxText.titleMedium("Oooops", fontWeight: 700)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.bodySmall("Something went wrong",
                      fontWeight: 600)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.bodySmall(
                "Please try again!",
                fontWeight: 500,
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: FxText.bodySmall("TRY AGAIN",
                        fontWeight: 600,
                        letterSpacing: 0.4,
                        color: theme.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
