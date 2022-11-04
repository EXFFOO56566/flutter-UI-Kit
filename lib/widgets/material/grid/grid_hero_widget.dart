/*
* File : Grid Hero
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/widgets/custom/full_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class GridHeroWidget extends StatefulWidget {
  @override
  _GridHeroWidgetState createState() => _GridHeroWidgetState();
}

class _GridHeroWidgetState extends State<GridHeroWidget> {
  late ThemeData themeData;

  List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
  ];

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
          title: FxText.titleMedium("Grid Hero", fontWeight: 600),
        ),
        body: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: _generateGridItems()));
  }
}
