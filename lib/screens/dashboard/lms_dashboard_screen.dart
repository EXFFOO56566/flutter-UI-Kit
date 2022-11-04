/*
* File : LMS Dashboard
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LMSDashboardScreen extends StatefulWidget {
  @override
  _LMSDashboardScreenState createState() => _LMSDashboardScreenState();
}

class _LMSDashboardScreenState extends State<LMSDashboardScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
            ),
          ),
          title: FxText.titleMedium("Learning Management", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: ListView(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: FxText.bodySmall("PROGRESS",
                        fontWeight: 600, letterSpacing: 0.3)),
                Container(
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      crossAxisCount: 2,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      children: <Widget>[
                        _SingleSubject(
                          completed: 58,
                          subject: 'ALL',
                          backgroundColor: Colors.blue,
                        ),
                        _SingleSubject(
                          completed: 45,
                          subject: 'Mathematics',
                          backgroundColor: Colors.red,
                        ),
                        _SingleSubject(
                          completed: 68,
                          subject: 'Science',
                          backgroundColor: Colors.green,
                        ),
                        _SingleSubject(
                          completed: 32,
                          subject: 'Other',
                          backgroundColor: Colors.orange,
                        ),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: FxText.bodySmall("SUBMISSIONS",
                      fontWeight: 600, letterSpacing: 0.3),
                ),
                Container(
                  child: _SubmissionWidget(),
                )
              ],
            )));
  }
}

class _SingleSubject extends StatelessWidget {
  final Color backgroundColor;
  final String subject;
  final int completed;

  const _SingleSubject(
      {Key? key,
      required this.backgroundColor,
      required this.subject,
      required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxContainer.none(
      borderRadiusAll: 4,
      color: backgroundColor,
      height: 125,
      child: Container(
        padding: EdgeInsets.only(bottom: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FxText.titleMedium(subject, fontWeight: 600, color: Colors.white),
            FxText.bodySmall(completed.floor().toString() + "% Completed",
                fontWeight: 500, color: Colors.white, letterSpacing: 0),
          ],
        ),
      ),
    );
  }
}

class _SubmissionWidget extends StatefulWidget {
  @override
  _SubmissionWidgetState createState() => _SubmissionWidgetState();
}

class _SubmissionWidgetState extends State<_SubmissionWidget> {
  int _currentStep = 0;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Stepper(
      physics: ClampingScrollPhysics(),
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return _buildControlBuilder(_currentStep);
      },
      currentStep: _currentStep,
      onStepTapped: (pos) {
        setState(() {
          _currentStep = pos;
        });
      },
      steps: <Step>[
        Step(
          isActive: true,
          title: FxText.bodyLarge('Due - 30, Apr', fontWeight: 600),
          subtitle: FxText.bodySmall('Science (figure 2.3)', fontWeight: 500),
          state: StepState.indexed,
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: FxText.bodySmall(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                color: theme.colorScheme.onBackground),
          ),
        ),
        Step(
          isActive: true,
          state: StepState.indexed,
          title: FxText.bodyLarge('Due - 28, Apr', fontWeight: 600),
          subtitle:
              FxText.bodySmall('Mathematics (lesson -2)', fontWeight: 400),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: FxText.bodySmall(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                color: theme.colorScheme.onBackground),
          ),
        ),
        Step(
            isActive: true,
            state: StepState.complete,
            title: FxText.bodyLarge('Completed - 14, Apr', fontWeight: 600),
            subtitle: FxText.bodySmall('Science (figure 2.2)', fontWeight: 400),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: FxText.bodySmall(
                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                  color: theme.colorScheme.onBackground),
            )),
        Step(
          isActive: true,
          state: StepState.complete,
          title: FxText.bodyLarge('Completed - 20, Apr', fontWeight: 600),
          subtitle:
              FxText.bodySmall('Mathematics (lesson - 1)', fontWeight: 400),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.only(top: 8),
              child: FxText.bodySmall(
                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                  color: theme.colorScheme.onBackground),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControlBuilder(int position) {
    if (position == 0 || position == 1) {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.center,
          child: FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {},
              child: FxText.bodySmall("Submit".toUpperCase(),
                  color: theme.colorScheme.onSecondary,
                  letterSpacing: 0.3,
                  fontWeight: 600)),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.center,
        child: FxButton(
            onPressed: () {},
            elevation: 0,
            borderRadiusAll: 4,
            child: FxText.bodySmall("Submitted".toUpperCase(),
                color: theme.colorScheme.onSecondary,
                letterSpacing: 0.3,
                fontWeight: 600)),
      ),
    );
  }
}
