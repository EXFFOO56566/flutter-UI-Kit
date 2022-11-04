/*
* File : Grid Hero
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import 'full_image_screen.dart';

class GridHeroScreen extends StatefulWidget {
  @override
  _GridHeroScreenState createState() => _GridHeroScreenState();
}

class _GridHeroScreenState extends State<GridHeroScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<String> _imageList = Images.squares.sublist(0, 14);

  void _showFullImage(String imagePath, String imageTag) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => FullImageScreen(
              imagePath: imagePath,
              imageTag: imageTag,
              backgroundOpacity: 200,
            )));
  }

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(GestureDetector(
        onTap: () {
          _showFullImage(_imageList[i % 14], 'imageTag-' + i.toString());
        },
        child: Container(
          child: Hero(
              tag: 'imageTag-' + i.toString(),
              child: Image(
                  image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill)),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: FxSpacing.xy(8, 12),
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: _generateGridItems())));
  }
}
