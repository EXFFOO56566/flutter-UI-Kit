/*
* File : Animated Switcher
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  @override
  _AnimatedSwitcherWidgetState createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  int _count = 0;

  bool isPlaying = true;

  Timer? _timer;

  void startTimer() {
    const oneSec = const Duration(milliseconds: 1500);
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Animated Switcher", fontWeight: 600),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: FxText.headlineMedium(
                    '$_count',
                    key: ValueKey<int>(_count),
                  ),
                ),
                ElevatedButton(
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
          ),
        ));
  }
}
