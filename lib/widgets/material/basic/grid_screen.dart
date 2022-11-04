/*
* File : Grid
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<String> _imageList = Images.squares.sublist(0, 14);

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(Container(
        child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
      ));
    }
    return list;
  }

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
        body: Container(
            padding: FxSpacing.fromLTRB(16, 16, 16, 0),
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: _generateGridItems())));
  }
}
