import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class RelaxationController extends FxController {
  double count = 76, totalCount = 76;
  bool isPlaying = true;
  Timer? timer;
  String positionText = "Breath In";

  final TickerProvider _tickerProvider;
  late Animation<double> animation;
  late AnimationController controller;

  RelaxationController(this._tickerProvider) {
    super.save = false;
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 5), vsync: _tickerProvider);
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        update();
      })
      ..addStatusListener((status) {});

    startTimer();
  }

  void startTimer() {
    controller.repeat(reverse: true, period: Duration(seconds: 3));
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      if (count > 0.1) {
        count -= 0.1;
        setPosition();
        update();
      } else {
        timer.cancel();
        if (!controller.isDismissed) controller.stop();
      }
    });
  }

  void setPosition() {
    int time = (totalCount - count).toInt() % 19;
    if (time < 4) {
      positionText = "Inhale";
    } else if (time < 11) {
      positionText = "Hold";
    } else {
      positionText = "Exhale";
    }
  }

  void toggle() {
    if (isPlaying) {
      isPlaying = false;
      timer!.cancel();
      update();
    } else {
      isPlaying = true;
      startTimer();
      update();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void goBack() {
    Navigator.pop(context);
  }

  @override
  String getTag() {
    return "relaxation_controller";
  }
}
