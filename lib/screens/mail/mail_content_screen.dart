/*
* File : Mail Content
* Version : 1.0.0
* */

import 'dart:math';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MailContentScreen extends StatefulWidget {
  @override
  _MailContentScreenState createState() => _MailContentScreenState();
}

class _MailContentScreenState extends State<MailContentScreen> {
  List<String> _simpleChoice = [
    "Move to",
    "Snooze",
    "Mark as important",
    "Mute",
    "Print",
    "Report spam",
    "Help and feedback"
  ];

  String _messageText =
      "1. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled \n\n 2. it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s \n\n 3. with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
      appBar: new AppBar(
        elevation: 0,
        leading: Material(
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(FeatherIcons.chevronLeft,
                    size: 20, color: theme.colorScheme.onBackground))),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 24),
            child: Material(
                child: InkWell(
                    child: Icon(MdiIcons.packageDown,
                        size: 24, color: theme.colorScheme.onBackground))),
          ),
          Container(
            margin: EdgeInsets.only(right: 24),
            child: Material(
                child: InkWell(
                    child: Icon(MdiIcons.trashCanOutline,
                        size: 24, color: theme.colorScheme.onBackground))),
          ),
          Container(
            child: Material(
                child: InkWell(
                    child: Icon(MdiIcons.emailOutline,
                        size: 24, color: theme.colorScheme.onBackground))),
          ),
          Material(
            child: InkWell(
              child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return _simpleChoice.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: FxText(choice,
                            fontWeight: 500, letterSpacing: 0.15),
                      );
                    }).toList();
                  },
                  icon: Icon(MdiIcons.dotsVertical,
                      color: theme.colorScheme.onBackground),
                  color: theme.backgroundColor),
            ),
          )
        ],
      ),
      body: Container(
        color: theme.backgroundColor,
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: FxText.titleLarge(
                          "I analyzed data from 65,000 software developer, their salaries and how they code",
                          fontWeight: 600)),
                  Container(
                    child: Icon(
                      MdiIcons.starOutline,
                      color: theme.colorScheme.onBackground,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: AssetImage(
                              "./assets/images/profile/avatar_2.jpg"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            FxText.titleMedium("Quincy Larson",
                                fontWeight: 600, letterSpacing: 0),
                            Container(
                                margin: EdgeInsets.only(left: 4),
                                child: FxText.bodySmall("4 day ago",
                                    fontWeight: 500, letterSpacing: 0)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            FxText.bodyMedium("to", fontWeight: 500),
                            Container(
                                margin: EdgeInsets.only(left: 2),
                                child:
                                    FxText.bodyMedium("me", fontWeight: 500)),
                            Container(
                                margin: EdgeInsets.only(left: 2),
                                child: Icon(
                                  MdiIcons.chevronDown,
                                  size: 18,
                                  color: theme.colorScheme.onBackground,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationX(pi),
                              child: Icon(
                                MdiIcons.subdirectoryArrowLeft,
                                size: 22,
                                color: theme.colorScheme.onBackground,
                              )),
                        ),
                        Icon(MdiIcons.dotsVertical,
                            size: 22, color: theme.colorScheme.onBackground)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: FxText.bodyMedium(_messageText, fontWeight: 500),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: Icon(
                                MdiIcons.shareOutline,
                                size: 20,
                                color: theme.colorScheme.onBackground,
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: FxText.bodyMedium("Replay", fontWeight: 600),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.shareOutline,
                            size: 20,
                            color: theme.colorScheme.onBackground,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child:
                                FxText.bodyMedium("Forward", fontWeight: 600),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.shareVariant,
                            size: 20,
                            color: theme.colorScheme.onBackground,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: FxText.bodyMedium("Share", fontWeight: 600),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
