/*
* File : Expansion Tile
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class ExpansionTileScreen extends StatefulWidget {
  @override
  _ExpansionTileScreenState createState() => _ExpansionTileScreenState();
}

class _ExpansionTileScreenState extends State<ExpansionTileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            ExpansionTile(
              initiallyExpanded: true,
              title: FxText("First tile"),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Center(child: FxText("This is first tile")),
                )
              ],
            ),
            ExpansionTile(
              title: FxText("Second tile"),
              children: <Widget>[
                Container(
                  padding: FxSpacing.all(16),
                  child: Center(child: FxText("This is second content")),
                )
              ],
            ),
            ExpansionTile(
              title: FxText("Third tile"),
              children: <Widget>[
                Container(
                  padding: FxSpacing.all(16),
                  child: Center(child: FxText("This is third content")),
                )
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
