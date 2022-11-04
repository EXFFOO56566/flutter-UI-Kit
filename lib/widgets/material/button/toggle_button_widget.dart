/*
* File : Toggle Button
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class ToggleButtonWidget extends StatefulWidget {
  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<bool> isSelected = [false, true, false];

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Toggle Button", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: FxText.titleSmall("Simple", fontWeight: 700),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        children: <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                        fillColor: Colors.transparent,
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: FxText.titleSmall("Filled", fontWeight: 700),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        color: theme.colorScheme.onBackground,
                        fillColor: theme.colorScheme.primary.withAlpha(48),
                        selectedBorderColor:
                            theme.colorScheme.primary.withAlpha(48),
                        children: <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: FxText.titleSmall("Bordered", fontWeight: 600),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        color: theme.colorScheme.onBackground,
                        fillColor: theme.colorScheme.primary.withAlpha(48),
                        borderWidth: 1,
                        borderColor: theme.colorScheme.onBackground,
                        selectedBorderColor: theme.colorScheme.primary,
                        children: <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8, top: 16),
                        child: FxText.titleSmall("Curved", fontWeight: 600),
                      ),
                      ToggleButtons(
                        splashColor: theme.colorScheme.primary.withAlpha(48),
                        color: theme.colorScheme.onBackground,
                        fillColor: theme.colorScheme.primary.withAlpha(48),
                        borderWidth: 1,
                        borderColor: theme.colorScheme.onBackground,
                        selectedBorderColor: theme.colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        children: <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
