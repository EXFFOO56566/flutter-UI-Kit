/*
* File : Upload File
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UploadDoneProgressWidget extends StatefulWidget {
  @override
  _UploadDoneProgressWidgetState createState() =>
      _UploadDoneProgressWidgetState();
}

class _UploadDoneProgressWidgetState extends State<UploadDoneProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late CustomTheme customTheme;
  late ThemeData theme;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    startTimer();
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    controller.repeat();

    const oneSec = Duration(seconds: 3);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              controller.stop(),
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
          return _UploadDoneDialog();
        });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.stop();
    controller.dispose();
    super.dispose();
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
          title: FxText.titleMedium("Upload File", fontWeight: 600),
        ),
        body: Center(
            child: isInProgress
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          ),
                          value: animation.value,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: FxText.bodyMedium("Uploading...",
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
                    child: FxText.bodyMedium("Upload File",
                        color: theme.colorScheme.onSecondary))));
  }
}

class _UploadDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
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
                MdiIcons.cloudCheckOutline,
                size: 40,
                color: theme.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.titleMedium("Success!", fontWeight: 700)),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: FxText.bodyMedium("Your file upload successful",
                      fontWeight: 600)),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                  child: FxText.bodySmall("Now you can check your file",
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
                    child: FxText.bodySmall("GO",
                        color: theme.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
