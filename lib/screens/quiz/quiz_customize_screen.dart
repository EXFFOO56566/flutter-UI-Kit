import 'package:flutkit/screens/quiz/quiz_question_type1_screen.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class QuizCustomizeScreen extends StatefulWidget {
  @override
  _QuizCustomizeScreenState createState() => _QuizCustomizeScreenState();
}

class _QuizCustomizeScreenState extends State<QuizCustomizeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _selected = [];
  }

  late List<int?> _selected;

  @override
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
                        child: Center(
                          child: FxText.titleMedium("Customize",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: FxSpacing.top(48),
                  child: FxText.bodyLarge("Customize your exam",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
                Container(
                  child: FxText.bodyMedium("You can select multiple subjects",
                      color: theme.colorScheme.onBackground,
                      muted: true,
                      fontWeight: 500),
                ),
                Container(
                    margin: FxSpacing.fromLTRB(24, 48, 24, 0),
                    child: GridView.count(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 3.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      children: <Widget>[
                        subject(subject: "Physics", index: 0),
                        subject(subject: "Chemistry", index: 1),
                        subject(subject: "Mathematics", index: 2),
                        subject(subject: "Coding", index: 3),
                        subject(subject: "AP Test", index: 4),
                        subject(subject: "NSE", index: 5),
                        subject(subject: "English", index: 6),
                        subject(subject: "Art", index: 7),
                        subject(subject: "History", index: 8),
                        subject(subject: "Music", index: 9),
                      ],
                    )),
                Container(
                  margin: FxSpacing.fromLTRB(48, 48, 48, 0),
                  width: MediaQuery.of(context).size.width,
                  child: FxButton(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuizQuestionType1Screen()));
                      },
                      child: FxText.bodyMedium(
                          _selected.isEmpty
                              ? "Select at least one subject"
                              : "NEXT",
                          letterSpacing: 0.3,
                          color: _selected.isEmpty
                              ? customTheme.onDisabled
                              : theme.colorScheme.onPrimary)),
                )
              ],
            )));
      },
    );
  }

  Widget subject({required String subject, int? index}) {
    return InkWell(
      onTap: () {
        if (_selected.contains(index)) {
          setState(() {
            _selected.remove(index);
          });
        } else {
          setState(() {
            _selected.add(index);
          });
        }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
                color: _selected.contains(index)
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground,
                width: 0.8)),
        child: Stack(
          children: <Widget>[
            Center(
                child: FxText.bodyLarge(subject,
                    color: _selected.contains(index)
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onBackground,
                    fontWeight: _selected.contains(index) ? 600 : 500)),
            _selected.contains(index)
                ? Positioned(
                    right: -1,
                    top: -1,
                    child: Container(
                      padding: FxSpacing.all(2),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8))),
                      child: Icon(
                        MdiIcons.check,
                        color: theme.colorScheme.onPrimary,
                        size: 16,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
