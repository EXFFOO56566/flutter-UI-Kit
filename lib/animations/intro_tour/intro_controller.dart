import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutx/flutx.dart';

class IntroController extends FxController {
  late Intro intro;

  @override
  void initState() {
    super.initState();
    intro = Intro(
      stepCount: 4,
      maskClosable: true,
      onHighlightWidgetTap: (introStatus) {
        print(introStatus);
      },

      /// use defaultTheme
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        texts: [
          'Hello, I\'m Flutter Intro.',
          'I can help you quickly implement the Step By Step guide in the Flutter project.',
          'My usage is also very simple, you can quickly learn and use it through example and api documentation.',
          'In order to quickly implement the guidance, I also provide a set of out-of-the-box themes, I wish you all a happy use, goodbye!',
        ],
        buttonTextBuilder: (currPage, totalPage) {
          return currPage < totalPage - 1 ? 'Next' : 'Finish';
        },
      ),
    );
    intro.setStepConfig(0, borderRadius: BorderRadius.circular(64));
    Timer(
      Duration(milliseconds: 500),
      () {
        intro.start(context);
      },
    );
  }

  startIntro() {
    intro.start(context);
  }

  void goBack() {
    Navigator.pop(context);
  }

  Future<bool> onWillPop() async {
    IntroStatus introStatus = intro.getStatus();
    if (introStatus.isOpen) {
      intro.dispose();
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  String getTag() {
    return "animation_intro_controller";
  }
}
