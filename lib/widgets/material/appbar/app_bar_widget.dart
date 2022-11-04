/*
* File : Appbar widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

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
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
          margin: FxSpacing.fromLTRB(16, 16, 16, 0),
          child: ListView(
            children: <Widget>[
              /*---------  Leading Icon Appbar ----------------*/
              Container(
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  leading: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(FeatherIcons.chevronLeft).autoDirection(),
                  ),
                  title: FxText.titleMedium("Leading Icon", fontWeight: 600),
                ),
              ),

              /*---------  Trailing Icon Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: FxText.titleMedium("Trailing Icons", fontWeight: 600),
                  actions: <Widget>[
                    Padding(
                      padding: FxSpacing.right(16),
                      child: Icon(
                        Icons.settings,
                        color: theme.appBarTheme.iconTheme!.color,
                      ),
                    ),
                    Padding(
                      padding: FxSpacing.x(16),
                      child: Icon(
                        Icons.code,
                        color: theme.appBarTheme.iconTheme!.color,
                      ),
                    ),
                  ],
                ),
              ),

              /*---------  Simple Menu Appbar ----------------*/
              Container(
                margin: EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: FxText.titleMedium("Simple Menu", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _simpleChoice.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Text(choice),
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
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: FxText.titleMedium("Menu with icons", fontWeight: 600),
                  actions: <Widget>[
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _textIconChoice.map((TextIconItem choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Row(
                              children: <Widget>[
                                Icon(choice.iconData, size: 18),
                                FxSpacing.width(8),
                                Text(choice.text)
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
                margin: FxSpacing.top(16),
                child: AppBar(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  title: FxText.titleMedium("Full app bar", fontWeight: 600),
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(FeatherIcons.chevronLeft),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: FxSpacing.x(16),
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
                                FxSpacing.width(8),
                                Text(choice.text,
                                    style: TextStyle(letterSpacing: 0.15)
                                        .merge(theme.textTheme.bodyText2)
                                        .merge(TextStyle(
                                            color: theme
                                                .colorScheme.onBackground)))
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
