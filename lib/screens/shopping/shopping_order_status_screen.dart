/*
* File : Shopping Order Status
* Version : 1.0.0
* */

import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingOrderStatusScreen extends StatefulWidget {
  @override
  _ShoppingOrderStatusScreenState createState() =>
      _ShoppingOrderStatusScreenState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _ShoppingOrderStatusScreenState extends State<ShoppingOrderStatusScreen> {
  int _currentStep = 3;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Receipt", MdiIcons.receipt),
    TextIconItem("Cancel", MdiIcons.cancel)
  ];

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 16),
          height: 200,
          child: PageView(
            pageSnapping: true,
            physics: ClampingScrollPhysics(),
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.80,
            ),
            onPageChanged: (int page) {
              setState(() {});
            },
            children: <Widget>[
              FxContainer.bordered(
                margin: EdgeInsets.only(
                    bottom: 8, right: Language.autoDirection(12, 0)!, top: 8),
                padding: EdgeInsets.only(left: 16),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.titleMedium("Order No: 381478",
                                  fontWeight: 600),
                              FxText.bodySmall("Placed on april, 14,2020",
                                  fontWeight: 400),
                            ],
                          ),
                          Container(
                            child: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return _textIconChoice
                                    .map((TextIconItem choice) {
                                  return PopupMenuItem(
                                    value: choice,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(choice.iconData,
                                            size: 18,
                                            color:
                                                theme.colorScheme.onBackground),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: FxText.bodyMedium(
                                            choice.text,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList();
                              },
                              icon: Icon(
                                MdiIcons.dotsVertical,
                                color: theme.colorScheme.onBackground,
                              ),
                              color: theme.backgroundColor,
                            ),
                          )
                        ],
                      ),
                      FxText.titleSmall("Paid", fontWeight: 600),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.titleSmall("Status : ", fontWeight: 500),
                          FxText.titleMedium("On the way", fontWeight: 600),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FxContainer.bordered(
                margin: EdgeInsets.only(bottom: 8, right: 12, left: 12, top: 8),
                padding: EdgeInsets.only(left: 16),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FxText.titleMedium("Order No: 47856521",
                                  fontWeight: 600),
                              FxText.bodySmall("Placed on feb, 14,2020",
                                  fontWeight: 400),
                            ],
                          ),
                          Container(
                            child: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return _textIconChoice
                                    .map((TextIconItem choice) {
                                  return PopupMenuItem(
                                    value: choice,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(choice.iconData,
                                            size: 18,
                                            color:
                                                theme.colorScheme.onBackground),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: FxText.bodyMedium(
                                            choice.text,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList();
                              },
                              icon: Icon(
                                MdiIcons.dotsVertical,
                                color: theme.colorScheme.onBackground,
                              ),
                              color: theme.backgroundColor,
                            ),
                          )
                        ],
                      ),
                      FxText.titleSmall("Cash on Delivery", fontWeight: 600),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FxText.titleSmall("Status : ", fontWeight: 500),
                          FxText.titleMedium("Delivered", fontWeight: 600),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FxContainer.bordered(
                margin: EdgeInsets.only(
                    top: 8, bottom: 8, left: Language.autoDirection(0, 12)!),
                child: Center(
                  child: FxText.titleMedium("VIEW ALL",
                      fontWeight: 600,
                      letterSpacing: 0.5,
                      color: theme.colorScheme.onBackground.withAlpha(200)),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.nBottom(20),
          child: FxText.titleSmall("STATUS",
              fontWeight: 700,
              color: theme.colorScheme.onBackground.withAlpha(200)),
        ),
        Container(
          child: Stepper(
            physics: ClampingScrollPhysics(),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Container();
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
                state: StepState.complete,
                title: FxText.bodyLarge('Order placed - 14 April',
                    fontWeight: 600),
                content: FxText.titleSmall("Order was received by seller",
                    fontWeight: 500),
              ),
              Step(
                isActive: true,
                state: StepState.complete,
                title: FxText.bodyLarge('Payment confirmed - 14 april',
                    fontWeight: 600),
                content: SizedBox(
                  child:
                      FxText.titleSmall("Pay via debit card", fontWeight: 600),
                ),
              ),
              Step(
                isActive: true,
                state: StepState.complete,
                title:
                    FxText.bodyLarge('Processing - 16 April', fontWeight: 600),
                content: SizedBox(
                  child: FxText.titleSmall(
                      "It may be take longer time than expected",
                      fontWeight: 500),
                ),
              ),
              Step(
                isActive: true,
                state: StepState.indexed,
                title: FxText.bodyLarge('On the way', fontWeight: 600),
                content: SizedBox(
                  child: FxText.titleSmall(
                      "Jenifer picked your order, you can contact her anytime",
                      fontWeight: 500),
                ),
              ),
              Step(
                state: StepState.indexed,
                title: FxText.bodyLarge('Deliver', fontWeight: 600),
                content: SizedBox(
                  child: FxText.titleSmall(
                      "Today at 2:30 PM order has been deliver",
                      fontWeight: 500),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
