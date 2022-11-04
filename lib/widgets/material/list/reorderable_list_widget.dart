/*
* File : Reorderable List
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReorderableListWidget extends StatefulWidget {
  @override
  _ReorderableListWidgetState createState() => _ReorderableListWidgetState();
}

class _ReorderableListWidgetState extends State<ReorderableListWidget> {
  List<String> alphabetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }

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
          title: FxText.titleMedium("Reorderable List", fontWeight: 600),
        ),
        body: ReorderableListView(
          onReorder: _onReorder,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: List.generate(
            alphabetList.length,
            (index) {
              return ListViewCard(
                alphabetList,
                index,
                Key('$index'),
              );
            },
          ),
        ));
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listItems;

  ListViewCard(this.listItems, this.index, this.key);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  late ThemeData theme = AppTheme.theme;

  @override
  Widget build(BuildContext context) {
    return FxContainer(
      borderRadiusAll: 4,
      paddingAll: 0,
      margin: FxSpacing.xy(20, 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: FxText.titleMedium(
                    'Title ${widget.listItems[widget.index]}',
                    fontWeight: 600,
                    maxLines: 5,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: FxText.titleSmall(
                    'Description ${widget.listItems[widget.index]}',
                    fontWeight: 500,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              MdiIcons.dragHorizontalVariant,
              color: theme.colorScheme.onBackground.withAlpha(200),
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
