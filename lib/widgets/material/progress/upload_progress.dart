/*
* File : Upload File
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class UploadProgress extends StatefulWidget {
  @override
  _UploadProgressState createState() => _UploadProgressState();
}

class _UploadProgressState extends State<UploadProgress>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData theme;
  late AnimationController controller;
  late Animation<double> animation;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
        body: Container(
            padding: FxSpacing.all(16),
            child: Center(
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
                          FxSpacing.width(20),
                          FxText.bodyMedium("Uploading...",
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
                        child: FxText.bodyMedium("Upload File",
                            color: theme.colorScheme.onSecondary)))));
  }
}

class _UploadDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: FxSpacing.all(16),
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
                Icons.cloud_upload_outlined,
                size: 40,
                color: theme.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.titleMedium("Success!", fontWeight: 700)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.bodyMedium("Your file upload successful",
                      fontWeight: 600)),
            ),
            Container(
              margin: FxSpacing.top(8),
              child: Center(
                  child: FxText.bodySmall("Now you can check your file",
                      fontWeight: 500)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                child: FxButton(
                    backgroundColor: theme.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: FxText.bodySmall("Go to Folder",
                        fontWeight: 600, color: theme.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
