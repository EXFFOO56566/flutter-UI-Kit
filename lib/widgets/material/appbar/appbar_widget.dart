/*
* File : Appbar widget
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
  ];

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView(
            children: <Widget>[
              /*---------  Leading Icon Appbar ----------------*/
              Container(
                child: AppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: FxText.titleMedium("Leading Icon", fontWeight: 600),
                ),
              ),

              /*---------  Trailing Icon Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  title: FxText.titleMedium("Trailing Icons", fontWeight: 600),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.settings,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.code,
                      ),
                    ),
                  ],
                ),
              ),

              /*---------  Simple Menu Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.appBarTheme.backgroundColor,
                  title: FxText.titleMedium("Simple Menu", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _simpleChoice.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: FxText(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),

              /*---------  Menu with Icons Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  title: FxText.titleMedium("Menu with icons", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _textIconChoice.map((TextIconItem choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(choice.iconData,
                                    size: 18,
                                    color:
                                        theme.popupMenuTheme.textStyle!.color),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: FxText(choice.text),
                                )
                              ],
                            ),
                          );
                        }).toList();
                      },
                      color: theme.backgroundColor,
                    ),
                  ],
                ),
              ),

              /*---------  Full Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  title: FxText.titleMedium("Full app bar", fontWeight: 600),
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.settings),
                    ),
                    Icon(Icons.code),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _textIconChoice.map((TextIconItem choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(choice.iconData,
                                    size: 18,
                                    color: theme.colorScheme.onBackground),
                                Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: FxText(
                                      choice.text,
                                    ))
                              ],
                            ),
                          );
                        }).toList();
                      },
                      color: theme.backgroundColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
