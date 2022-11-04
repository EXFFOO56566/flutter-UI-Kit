/*
* File : Positioned FAB
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class PositionedFAB extends StatefulWidget {
  @override
  _PositionedFABState createState() => _PositionedFABState();
}

class _PositionedFABState extends State<PositionedFAB> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _radioValue = 1;
  int fabEndDocked = 1,
      fabEndFloat = 2,
      fabCenterDocked = 3,
      fabCenterFloat = 4,
      fabEndTop = 5,
      fabMiniStartTop = 6,
      fabStartTop = 7;

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  _handleValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 1:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endDocked;
          });
          break;
        case 2:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endFloat;
          });
          break;
        case 3:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.centerDocked;
          });
          break;
        case 4:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.centerFloat;
          });
          break;
        case 5:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endTop;
          });
          break;
        case 6:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.miniStartTop;
          });
          break;
        case 7:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.startTop;
          });
          break;
        default:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endDocked;
          });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* Click listener */
          },
          child: Icon(Icons.add),
          backgroundColor: theme.colorScheme.primary,
        ),
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.none,
          color: customTheme.card,
          notchMargin: 4,
          elevation: 4,
          child: Container(
            height: 70,
          ),
        ),
        body: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabEndDocked);
                  },
                  child: Container(
                    margin: FxSpacing.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabEndDocked);
                          },
                          groupValue: _radioValue,
                          value: fabEndDocked,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall(
                          "End Docked",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.15,
                          fontWeight: 500,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabEndFloat);
                  },
                  child: Container(
                    margin: FxSpacing.xy(16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabEndFloat);
                          },
                          groupValue: _radioValue,
                          value: fabEndFloat,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall("End Float",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabCenterDocked);
                  },
                  child: Container(
                    margin: FxSpacing.xy(16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabCenterDocked);
                          },
                          groupValue: _radioValue,
                          value: fabCenterDocked,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall("Center Docked",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabCenterFloat);
                  },
                  child: Container(
                    margin: FxSpacing.xy(16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabCenterFloat);
                          },
                          groupValue: _radioValue,
                          value: fabCenterFloat,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall("Center Float",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabEndTop);
                  },
                  child: Container(
                    margin: FxSpacing.xy(16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabEndTop);
                          },
                          groupValue: _radioValue,
                          value: fabEndTop,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall("End Top",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabMiniStartTop);
                  },
                  child: Container(
                    margin: FxSpacing.xy(16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabMiniStartTop);
                          },
                          groupValue: _radioValue,
                          value: fabMiniStartTop,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall("Mini Top",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _handleValueChange(fabStartTop);
                  },
                  child: Container(
                    margin: FxSpacing.xy(16, 8),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (dynamic value) {
                            _handleValueChange(fabStartTop);
                          },
                          groupValue: _radioValue,
                          value: fabStartTop,
                          activeColor: theme.colorScheme.primary,
                        ),
                        FxText.titleSmall("Start Top",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            fontWeight: 500),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
