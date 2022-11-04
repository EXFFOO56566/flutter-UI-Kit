/*
* File : Animated Switcher
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class AnimatedSwitcherScreen extends StatefulWidget {
  @override
  _AnimatedSwitcherScreenState createState() => _AnimatedSwitcherScreenState();
}

class _AnimatedSwitcherScreenState extends State<AnimatedSwitcherScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    startTimer();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  int _count = 0;

  bool isPlaying = true;

  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(milliseconds: 1500);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          setState(() {
            _count += 1;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: FxText.headlineMedium(
              '$_count',
              key: ValueKey<int>(_count),
            ),
          ),
          FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {
                if (isPlaying) {
                  setState(() {
                    isPlaying = false;
                    _timer!.cancel();
                  });
                } else {
                  setState(() {
                    isPlaying = true;
                    startTimer();
                  });
                }
              },
              child: FxText.bodyMedium(isPlaying ? "Pause" : "Play",
                  fontWeight: 600, color: theme.colorScheme.onPrimary)),
        ],
      ),
    ));
  }
}
