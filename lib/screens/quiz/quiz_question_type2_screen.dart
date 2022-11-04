import 'dart:async';

import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class QuizQuestionType2Screen extends StatefulWidget {
  @override
  _QuizQuestionType2ScreenState createState() =>
      _QuizQuestionType2ScreenState();
}

class _QuizQuestionType2ScreenState extends State<QuizQuestionType2Screen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _selected = [];
    startTimer();
  }

  int quizTimeSecond = 30;
  double remainingSecond = 30;
  late List<int?> _selected;
  bool isFlag = false, isFavourite = false;

  List<String> _simpleChoice = ["Report", "Quit"];

  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: 200),
        (Timer timer) => {
              setState(() {
                if (remainingSecond > 0.200) {
                  remainingSecond = remainingSecond - 0.200;
                } else {
                  remainingSecond = 0;
                  timer.cancel();
                }
              })
            });
  }

  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Column(
              children: <Widget>[
                Container(
                  padding: FxSpacing.fromLTRB(16, 40, 16, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            MdiIcons.chevronLeft,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            FxText.titleMedium("Chemistry",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 700),
                            FxText.bodySmall("Question 7/20",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500)
                          ],
                        ),
                      ),
                      Container(
                        child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return _simpleChoice.map((String choice) {
                              return PopupMenuItem(
                                value: choice,
                                child: FxText.bodyMedium(choice,
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0.2),
                              );
                            }).toList();
                          },
                          color: theme.backgroundColor,
                          icon: Icon(MdiIcons.dotsVertical,
                              color: theme.colorScheme.onBackground),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: FxSpacing.fromLTRB(48, 0, 48, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: FxText.titleLarge(
                            "The metallurgical process in which a metal is obtained in a fused state is called?",
                            letterSpacing: 0.2,
                            wordSpacing: 0.5,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              questionOption(option: "Smelting", index: 0),
                              questionOption(option: "Roasting", index: 1),
                              questionOption(option: "Calcinations", index: 2),
                              questionOption(
                                  option: "Froth floatation", index: 3),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.chevronLeft,
                                        color: theme.colorScheme.primary,
                                        size: 20,
                                      ),
                                      Container(
                                        margin: FxSpacing.left(8),
                                        child: FxText.bodySmall("PREV",
                                            letterSpacing: 0.5,
                                            color: theme.colorScheme.primary,
                                            fontWeight: 600),
                                      ),
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      FxText.bodySmall(
                                          _selected.isEmpty ? "SKIP" : "NEXT",
                                          letterSpacing: 0.5,
                                          color: theme.colorScheme.primary,
                                          fontWeight: 600),
                                      Container(
                                        margin: FxSpacing.left(4),
                                        child: Icon(
                                          MdiIcons.chevronRight,
                                          color: theme.colorScheme.primary,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: customTheme.card,
                  padding: FxSpacing.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFlag = !isFlag;
                          });
                        },
                        child: Container(
                          child: Icon(
                            isFlag ? MdiIcons.flag : MdiIcons.flagOutline,
                            color: isFlag
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onBackground,
                            size: 26,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: buildTimer(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        child: Container(
                          child: Icon(
                            isFavourite
                                ? MdiIcons.heart
                                : MdiIcons.heartOutline,
                            color: isFavourite
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onBackground,
                            size: 26,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
      },
    );
  }

  Widget questionOption({required String option, int? index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selected.contains(index)) {
            _selected.remove(index);
          } else {
            _selected.add(index);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _selected.contains(index)
                ? theme.colorScheme.primary
                : Colors.transparent,
            border: Border.all(
                color: _selected.contains(index)
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        padding: FxSpacing.fromLTRB(0, 12, 0, 12),
        margin: FxSpacing.fromLTRB(48, 0, 48, 16),
        child: Center(
          child: FxText.bodyLarge(option,
              color: _selected.contains(index)
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground,
              fontWeight: 600),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return Container(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: CircularProgressIndicator(
              valueColor: remainingSecond > 5
                  ? AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    )
                  : AlwaysStoppedAnimation<Color>(
                      customTheme.colorError,
                    ),
              value: (quizTimeSecond - remainingSecond) / quizTimeSecond,
            ),
          ),
          Container(
            child: FxText.bodyLarge(remainingSecond.ceil().toString(),
                color: theme.colorScheme.onBackground, fontWeight: 600),
          )
        ],
      ),
    );
  }
}
