/*
* File : Timeline Stepper
* Version : 1.0.0
* */

import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class TimelineStepperScreen extends StatefulWidget {
  @override
  _TimelineStepperScreenState createState() => _TimelineStepperScreenState();
}

class _TimelineStepperScreenState extends State<TimelineStepperScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  int _currentStep = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Container(
            margin: FxSpacing.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {},
                    child: FxText.bodySmall("Contact".toUpperCase(),
                        fontWeight: 600,
                        letterSpacing: 0.4,
                        color: theme.colorScheme.onPrimary)),
              ],
            ),
          );
        },
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep >= 4) return;
          setState(() {
            _currentStep += 1;
          });
        },
        onStepCancel: () {
          if (_currentStep <= 0) return;
          setState(() {
            _currentStep -= 1;
          });
        },
        onStepTapped: (pos) {
          setState(() {
            _currentStep = pos;
          });
        },
        steps: <Step>[
          Step(
              isActive: true,
              state: StepState.complete,
              title: FxText.bodyLarge('Completed - 14, Apr', fontWeight: 600),
              content: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(Images.profiles[1]),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Container(
                          margin: FxSpacing.left(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.bodySmall("Assigned to", fontWeight: 500),
                              FxText.bodyLarge("Mark Laurren", fontWeight: 600),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: FxSpacing.top(8),
                      child: FxText.bodySmall(
                          " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                          color: theme.colorScheme.onBackground),
                    )
                  ],
                ),
              )),
          Step(
            isActive: true,
            state: StepState.complete,
            title: FxText.bodyLarge('Completed - 16, Apr', fontWeight: 600),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: AssetImage(Images.profiles[2]),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: FxSpacing.left(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.bodySmall("Assigned to", fontWeight: 500),
                            FxText.bodyLarge("Robert Downey", fontWeight: 600),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: FxSpacing.top(8),
                    child: FxText.bodySmall(
                        " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                        color: theme.colorScheme.onBackground),
                  )
                ],
              ),
            ),
          ),
          Step(
            state: StepState.disabled,
            title: FxText.bodyLarge("Task Removed", fontWeight: 500),
            content: Container(),
          ),
          Step(
            isActive: true,
            title: FxText.bodyLarge('Working (due date - 24 Apr)',
                fontWeight: 600),
            state: StepState.editing,
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Images.profiles[3]),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: FxSpacing.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.bodySmall("Assigned to", fontWeight: 500),
                            FxText.bodyLarge("Mark Laurren", fontWeight: 600),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: FxSpacing.top(8),
                    child: FxText.bodySmall(
                        " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                        color: theme.colorScheme.onBackground),
                  )
                ],
              ),
            ),
          ),
          Step(
            isActive: true,
            state: StepState.indexed,
            title: FxText.bodyLarge('Upcoming Task', fontWeight: 600),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Images.profiles[1]),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: FxSpacing.left(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FxText.bodySmall("Assign to", fontWeight: 500),
                            FxText.bodyLarge(
                              "Nat Bentlee",
                              fontWeight: 600,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: FxSpacing.top(8),
                      child: FxText.bodySmall(
                          " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                          fontWeight: 500))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
