/*
* File : Refresh List
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class RefreshListWidget extends StatefulWidget {
  @override
  _RefreshListWidgetState createState() => _RefreshListWidgetState();
}

class _RefreshListWidgetState extends State<RefreshListWidget> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> _items = [
    "Item - 2",
    "Item - 1",
  ];

  Widget _buildItem(BuildContext context, int index, animation) {
    String item = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Pull to Refresh", fontWeight: 600),
        ),
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
          .insertItem(0, duration: const Duration(milliseconds: 200));
      _items = []
        ..add("Item - " + (_items.length + 1).toString())
        ..addAll(_items);
    });
  }
}
