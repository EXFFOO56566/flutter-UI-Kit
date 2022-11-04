/*
* File : Reorderable List
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class ReOrderableList extends StatefulWidget {
  @override
  _ReOrderableListState createState() => _ReOrderableListState();
}

class _ReOrderableListState extends State<ReOrderableList> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReorderableListView(
      onReorder: _onReorder,
      scrollDirection: Axis.vertical,
      padding: FxSpacing.y(8),
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
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      margin: FxSpacing.all(8),
      color: theme.cardColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: FxSpacing.fromLTRB(8, 8, 0, 0),
                  child: FxText.titleMedium(
                    'Title ${widget.listItems[widget.index]}',
                    fontWeight: 600,
                    maxLines: 5,
                  ),
                ),
                Container(
                  padding: FxSpacing.all(8),
                  child: FxText.titleSmall(
                    'Description ${widget.listItems[widget.index]}',
                    fontWeight: 500,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.width(16),
          Icon(
            Icons.drag_indicator,
            color: theme.colorScheme.onBackground.withAlpha(200),
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
