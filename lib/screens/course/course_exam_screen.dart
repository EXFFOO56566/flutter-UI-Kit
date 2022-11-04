import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CourseExamScreen extends StatefulWidget {
  @override
  _CourseExamScreenState createState() => _CourseExamScreenState();
}

class _CourseExamScreenState extends State<CourseExamScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool isPlaying = false;

  int repeatType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          margin: FxSpacing.fromLTRB(
              24, FxSpacing.safeAreaTop(context) + 20, 24, 0),
          padding: FxSpacing.all(16),
          decoration: BoxDecoration(
              color: customTheme.card,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: customTheme.border, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    FxText.bodyMedium("Scores",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    Container(
                      margin: FxSpacing.top(8),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withAlpha(40),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Center(
                        child: FxText.bodyLarge("10",
                            color: theme.colorScheme.primary, fontWeight: 700),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    FxText.bodyMedium("Time",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    Container(
                      margin: FxSpacing.top(8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(40),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Center(
                                child: FxText.bodyLarge("6",
                                    color: theme.colorScheme.primary,
                                    fontWeight: 700)),
                          ),
                          Container(
                              margin: FxSpacing.horizontal(8),
                              child: FxText.bodyLarge(":",
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: 600)),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(40),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Center(
                              child: FxText.bodyLarge("16",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 700),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: FxSpacing.zero,
            children: <Widget>[
              Container(
                margin: FxSpacing.fromLTRB(24, 16, 24, 0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image(
                          image: AssetImage(
                              './assets/images/apps/course/subject-6.jpg'),
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.width * 0.28,
                        )),
                    Container(
                      margin: FxSpacing.left(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.bodyLarge("Lesson 1\nOnline Exam",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                          Container(
                            margin: FxSpacing.top(2),
                            child: FxText.bodySmall("5 Question from lesson 1",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500,
                                muted: true),
                          ),
                          FxText.bodySmall("MCQs",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500,
                              muted: true),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: <Widget>[
                    SingleQuestion(
                      qNumber: 1,
                      question: "Young's modulus is the property of?",
                      options: [
                        "Gas only",
                        "Both Solid and Liquid",
                        "Solid only",
                        "Liquid only"
                      ],
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: SingleQuestion(
                        qNumber: 2,
                        question:
                            "Movement of cell against concentration gradient is called",
                        options: [
                          "osmosis",
                          "active transport",
                          "diffusion",
                          "passive transport"
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.vertical(16),
                      child: SingleQuestion(
                        qNumber: 3,
                        question: "Plants receive their nutrients mainly from",
                        options: ["chlorophyll", "atmosphere", "light", "soil"],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class SingleQuestion extends StatefulWidget {
  final int? qNumber;
  final question;
  final List<String>? options;

  const SingleQuestion({Key? key, this.qNumber, this.question, this.options})
      : super(key: key);

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    Widget buildOptions() {
      List<Widget> _list = [];
      for (int i = 0; i < widget.options!.length; i++) {
        _list.add(Container(
          margin: FxSpacing.bottom(12),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedOption = i;
              });
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      color: selectedOption == i
                          ? customTheme.colorSuccess
                          : customTheme.card,
                      borderRadius: BorderRadius.all(Radius.circular(
                        4,
                      ))),
                  child: Center(
                    child: selectedOption == i
                        ? Icon(
                            MdiIcons.check,
                            size: 16,
                            color: customTheme.onSuccess,
                          )
                        : Container(),
                  ),
                ),
                Container(
                  margin: FxSpacing.left(16),
                  child: FxText.titleSmall(widget.options![i],
                      color: theme.colorScheme.onBackground, fontWeight: 500),
                )
              ],
            ),
          ),
        ));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _list,
      );
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: FxSpacing.all(8),
            decoration: BoxDecoration(
                color: customTheme.card,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: FxText.bodyMedium("Q." + widget.qNumber.toString(),
                color: theme.colorScheme.onBackground, fontWeight: 600),
          ),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyLarge(widget.question,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: FxSpacing.top(16),
                    child: Column(
                      children: <Widget>[buildOptions()],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
