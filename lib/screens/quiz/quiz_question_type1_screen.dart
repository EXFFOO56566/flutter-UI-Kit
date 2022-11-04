import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class QuizQuestionType1Screen extends StatefulWidget {
  @override
  _QuizQuestionType1ScreenState createState() =>
      _QuizQuestionType1ScreenState();
}

class _QuizQuestionType1ScreenState extends State<QuizQuestionType1Screen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  int quizTimeSecond = 30;
  double remainingSecond = 30;
  int? _selectedOption = -1;
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
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                body: Column(
              children: <Widget>[
                Container(
                  padding: FxSpacing.fromLTRB(16, 42, 16, 0),
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
                            FxText.titleMedium("Molecular Physics",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 700),
                            FxText.bodySmall("Question 1/20",
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
                                child: FxText.bodyMedium(
                                  choice,
                                  letterSpacing: 0.15,
                                  color: theme.colorScheme.onBackground,
                                ),
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
                            "If electrical conductivity increases with the increase of temperature of a substance, then it is a?",
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
                              questionOption(option: "Conductor", index: 0),
                              questionOption(option: "Semiconductor", index: 1),
                              questionOption(option: "Insulator", index: 2),
                              questionOption(option: "Carburetor", index: 3),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      FxText.bodySmall(
                                          _selectedOption == -1
                                              ? "SKIP"
                                              : "NEXT",
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
          _selectedOption = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _selectedOption == index
                ? theme.colorScheme.primary
                : Colors.transparent,
            border: Border.all(
                color: _selectedOption == index
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        padding: FxSpacing.fromLTRB(0, 12, 0, 12),
        margin: FxSpacing.fromLTRB(48, 0, 48, 16),
        child: Center(
          child: FxText.bodyLarge(option,
              color: _selectedOption == index
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
