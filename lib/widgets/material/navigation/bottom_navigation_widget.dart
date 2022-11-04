/*
* File : Bottom Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(FeatherIcons.chevronLeft).autoDirection(),
        ),
        title: FxText.titleMedium("Bottom Navigation", fontWeight: 600),
      ),
      body: Container(
        color: theme.backgroundColor,
        child: Center(
          child: _currentIndex == 0
              ? Icon(Icons.chat,
                  color: theme.colorScheme.onBackground, size: 80)
              : Icon(Icons.call,
                  color: theme.colorScheme.onBackground, size: 80),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        /*----------- Build Bottom Navigation Tab here ---------------*/
        currentIndex: _currentIndex,
        backgroundColor: theme.bottomAppBarTheme.color,
        selectedIconTheme: IconThemeData(color: theme.primaryColor),
        selectedItemColor: theme.primaryColor,
        unselectedIconTheme:
            IconThemeData(color: theme.colorScheme.onBackground),
        unselectedItemColor: theme.colorScheme.onBackground,
        onTap: onTapped,
        items: [
          /*----------- Build Bottom Navigation Content here ---------------*/
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'CHAT'),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'CALL',
          )
        ],
      ),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
