/*
* File : Expansion Tile
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class ExpansionTileWidget extends StatefulWidget {
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
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
          title: FxText.titleMedium("Expansion Tile", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Column(
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
                          padding: EdgeInsets.all(16),
                          child:
                              Center(child: FxText("This is second content")),
                        )
                      ],
                    ),
                    ExpansionTile(
                      title: FxText("Third tile"),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Center(child: FxText("This is third content")),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
