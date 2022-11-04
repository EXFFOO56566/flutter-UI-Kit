/*
* File : Refresh List
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class RefreshList extends StatefulWidget {
  @override
  _RefreshListState createState() => _RefreshListState();
}

class _RefreshListState extends State<RefreshList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<String> _items = [
    "Item - 2",
    "Item - 1",
  ];

  Widget _buildItem(BuildContext context, int index, animation) {
    String item = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: ListTile(
        title: FxText.bodyLarge(item, fontWeight: 600, letterSpacing: 0.3),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    addItem();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: RefreshIndicator(
        backgroundColor: theme.backgroundColor,
        color: theme.colorScheme.primary,
        onRefresh: _onRefresh,
        child: AnimatedList(
          key: listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(context, index, animation);
          },
        ),
      ),
    ));
  }

  void addItem() {
    setState(() {
      listKey.currentState!
          .insertItem(0, duration: Duration(milliseconds: 200));
      _items = []
        ..add("Item - " + (_items.length + 1).toString())
        ..addAll(_items);
    });
  }
}
