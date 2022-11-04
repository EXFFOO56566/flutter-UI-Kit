/*
* File : Mail Compose
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MailComposeScreen extends StatefulWidget {
  @override
  _MailComposeScreenState createState() => _MailComposeScreenState();
}

class _MailComposeScreenState extends State<MailComposeScreen> {
  List<String> _simpleChoice = [
    "Schedule send",
    "Confidential Mode",
    "Discard",
    "Settings",
    "help and feedback"
  ];
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
        title: FxText('Compose', fontWeight: 600, letterSpacing: 0.15),
        leading: Material(
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(MdiIcons.chevronLeft,
                    size: 28,
                    color: Theme.of(context).colorScheme.onBackground))),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 24),
            child: Material(
                child: InkWell(
                    child: Icon(MdiIcons.attachment,
                        size: 28,
                        color: Theme.of(context).colorScheme.onBackground))),
          ),
          Container(
            child: Material(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(MdiIcons.send,
                        size: 24,
                        color: Theme.of(context).colorScheme.onBackground))),
          ),
          Material(
            child: InkWell(
              child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return _simpleChoice.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: FxText(
                          choice,
                        ),
                      );
                    }).toList();
                  },
                  icon: Icon(MdiIcons.dotsVertical,
                      color: Theme.of(context).colorScheme.onBackground),
                  color: Theme.of(context).backgroundColor),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        width: 60,
                        child: FxText.bodyLarge(
                          "From",
                        )),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller:
                            TextEditingController(text: "nat@gmail.com"),
                      ),
                    ),
                    Icon(
                      MdiIcons.chevronDown,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 1,
                height: 0,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      child: FxText.bodyLarge(
                        "To",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Icon(MdiIcons.chevronDown,
                        color: Theme.of(context).colorScheme.onBackground)
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 1,
                height: 0,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Subject"),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 1,
                height: 0,
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Compose email"),
                        maxLines: 10,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
