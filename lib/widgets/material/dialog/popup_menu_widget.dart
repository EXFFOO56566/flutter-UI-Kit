/*
* File : Popup Menu with Icon
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class PopupMenuWidget extends StatefulWidget {
  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  final GlobalKey _textIconMenuKey = new GlobalKey();
  final GlobalKey _simpleMenuKey = new GlobalKey();

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Popup with icons", fontWeight: 600),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PopupMenuButton(
                key: _simpleMenuKey,
                itemBuilder: (BuildContext context) {
                  return _simpleChoice.map((String choice) {
                    return PopupMenuItem(
                        value: choice,
                        child: FxText(
                          choice,
                        ));
                  }).toList();
                },
                color: theme.backgroundColor,
                child: FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      dynamic state = _simpleMenuKey.currentState;
                      state.showButtonMenu();
                    },
                    child: FxText.titleSmall("Popup Menu",
                        color: theme.colorScheme.onPrimary, fontWeight: 500)),
              ),
              PopupMenuButton(
                key: _textIconMenuKey,
                itemBuilder: (BuildContext context) {
                  return _textIconChoice.map((TextIconItem choice) {
                    return PopupMenuItem(
                      value: choice,
                      child: Row(
                        children: <Widget>[
                          Icon(choice.iconData,
                              size: 18, color: theme.colorScheme.onBackground),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: FxText(
                              choice.text,
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList();
                },
                child: FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      dynamic state = _textIconMenuKey.currentState;
                      state.showButtonMenu();
                    },
                    child: FxText.titleSmall("Text with icon menu",
                        color: theme.colorScheme.onPrimary, fontWeight: 500)),
              ),
            ],
          ),
        ));
  }
}
