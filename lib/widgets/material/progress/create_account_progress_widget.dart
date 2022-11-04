/*
* File : Create Account
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreateAccountProgressWidget extends StatefulWidget {
  @override
  _CreateAccountProgressWidgetState createState() =>
      _CreateAccountProgressWidgetState();
}

class _CreateAccountProgressWidgetState
    extends State<CreateAccountProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late Timer _timer;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Account", fontWeight: 600),
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
                        child: FxText.bodyMedium("Creating...",
                            fontWeight: 600, letterSpacing: 0.3),
                      )
                    ],
                  )
                : FxButton(
                    elevation: 2,
                    borderRadiusAll: 4,
                    onPressed: () {
                      startTimer();
                    },
                    child: FxText.bodyMedium("Create Account",
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.4))));
  }
}

class _CreateAccountDialog extends StatelessWidget {
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
                MdiIcons.accountCheckOutline,
                size: 40,
                color: theme.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child:
                  Center(child: FxText.titleMedium("Thanks!", fontWeight: 700)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.bodySmall(
                      "Your account has been successfully created.",
                      fontWeight: 600,
                      letterSpacing: 0)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.bodySmall(
                "Please check your inbox, a code is sent on your email as well as your mobile no.",
                fontWeight: 500,
                height: 1.15,
                textAlign: TextAlign.center,
              )),
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
