/*
* File : Company Profile
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CompanyProfileScreen extends StatefulWidget {
  @override
  _CompanyProfileScreenState createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> _skillList = [
    "Photoshop",
    "Adobe XD",
    "Dart",
    "Flutter",
    "Java",
    "OOP",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          elevation: 0,
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            FxSpacing.height(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleLarge("Martyn Rankin", fontWeight: 600),
                    FxText.bodyMedium(
                      "UX Designer",
                    ),
                  ],
                ),
                FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {},
                    child: FxText.bodyMedium("Follow",
                        fontWeight: 600,
                        letterSpacing: 0.3,
                        color: theme.colorScheme.onPrimary))
              ],
            ),
            FxSpacing.height(20),
            FxContainer.bordered(
              borderRadiusAll: 4,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FxText.titleMedium("210+", fontWeight: 700),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: FxText.titleSmall("Project",
                            fontWeight: 600, letterSpacing: 0),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FxText.titleMedium("486", fontWeight: 700),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: FxText.titleSmall("Followers",
                            fontWeight: 600, letterSpacing: 0),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FxText.titleMedium("58", fontWeight: 700),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: FxText.titleSmall("Following",
                            fontWeight: 600, letterSpacing: 0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            FxText.titleMedium("Skill", fontWeight: 600),
            FxSpacing.height(20),
            Wrap(
              children: _buildChoiceList(),
            ),
            FxSpacing.height(20),
            FxText.titleMedium("Project", fontWeight: 600),
            ProjectsWidget()
          ],
        ));
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    _skillList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.only(left: 2, right: 2, top: 4, bottom: 4),
        child: Chip(
          backgroundColor: theme.colorScheme.background,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: FxText.bodyMedium(
            item,
          ),
        ),
      ));
    });
    return choices;
  }
}

class ProjectsWidget extends StatefulWidget {
  @override
  _ProjectsWidgetState createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  int _currentStep = 1;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Stepper(
      physics: ClampingScrollPhysics(),
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return SizedBox.shrink();
      },
      currentStep: _currentStep,
      onStepTapped: (pos) {
        setState(() {
          _currentStep = pos;
        });
      },
      steps: <Step>[
        Step(
            state: StepState.indexed,
            title: FxText.titleSmall('Upcoming', fontWeight: 700),
            subtitle: FxText.bodySmall('Start at 20, dec',
                fontWeight: 600, letterSpacing: 0),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: FxText.bodySmall(
                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                  fontWeight: 500,
                  letterSpacing: 0),
            )),
        Step(
          isActive: true,
          title: FxText.titleSmall('Flutter UIKit', fontWeight: 700),
          subtitle: FxText.bodySmall('Complete at 18, jan',
              fontWeight: 600, letterSpacing: 0),
          state: StepState.editing,
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: FxText.bodySmall(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                fontWeight: 500,
                letterSpacing: 0),
          ),
        ),
        Step(
          isActive: true,
          state: StepState.complete,
          title: FxText.titleSmall('Finished', fontWeight: 700),
          subtitle: FxText.bodySmall('Project no. 2',
              fontWeight: 600, letterSpacing: 0),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: FxText.bodySmall(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                fontWeight: 500,
                letterSpacing: 0),
          ),
        ),
      ],
    );
  }
}
