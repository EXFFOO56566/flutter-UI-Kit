/*
* File : Create Account
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CreateAccountProgress extends StatefulWidget {
  @override
  _CreateAccountProgressState createState() => _CreateAccountProgressState();
}

class _CreateAccountProgressState extends State<CreateAccountProgress>
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
    const oneSec = Duration(seconds: 2);
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
          return _CreateAccountDialog();
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
        body: Container(
            padding: FxSpacing.all(16),
            child: Center(
                child: isInProgress
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          )),
                          FxSpacing.width(20),
                          FxText.bodyMedium("Creating...",
                              fontWeight: 600, letterSpacing: 0.3)
                        ],
                      )
                    : FxButton(
                        backgroundColor: theme.colorScheme.primary,
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        child: FxText.bodyMedium("Create Account",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.4)))));
  }
}

class _CreateAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: FxSpacing.xy(24, 16),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
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
                Icons.person_outline,
                size: 40,
                color: theme.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: FxSpacing.top(16),
              child:
                  Center(child: FxText.titleMedium("Thanks!", fontWeight: 700)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.bodySmall(
                      "Your account has been successfully created.",
                      fontWeight: 600,
                      letterSpacing: 0)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.bodySmall(
                "Please check your inbox, a code is sent on your email as well as your mobile no.",
                fontWeight: 500,
                height: 1.15,
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                child: FxButton(
                    backgroundColor: theme.colorScheme.primary,
                    borderRadiusAll: 4,
                    elevation: 0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: FxText.bodySmall("VERIFY",
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
