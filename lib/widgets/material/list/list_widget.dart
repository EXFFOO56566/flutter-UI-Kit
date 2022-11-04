/*
* File : List
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<int> _list = List.generate(20, (i) => i);

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
          title: FxText.titleMedium("List", fontWeight: 600),
        ),
        body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return Ink(
                color: theme.backgroundColor,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondary,
                    child: FxText.bodyLarge(_list[index].toString(),
                        color: theme.colorScheme.onSecondary),
                  ),
                  title: FxText.bodyLarge('Item - ' + _list[index].toString(),
                      fontWeight: 500),
                ));
          },
        ));
  }
}
