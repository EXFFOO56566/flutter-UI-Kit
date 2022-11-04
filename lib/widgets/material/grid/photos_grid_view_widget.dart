/*
* File : Photos Grid
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class PhotosGridViewWidget extends StatefulWidget {
  @override
  _PhotosGridViewWidgetState createState() => _PhotosGridViewWidgetState();
}

class _PhotosGridViewWidgetState extends State<PhotosGridViewWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

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
    './assets/images/all/all-15.jpg',
  ];

  int number = 0;

  _generateGridItems(int size) {
    List<Widget> list = [];
    for (int i = 0; i < size; i++) {
      list.add(ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Image.asset(
          _imageList[(number) % 15],
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ));
      number++;
    }
    return list;
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
          title: FxText.titleMedium(
            "Grid Photos",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 0, left: 16, right: 8),
                child: FxText.bodyMedium("29, Jun 2020", fontWeight: 600),
              ),
              Container(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(4.0),
                  shrinkWrap: true,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: _generateGridItems(7),
                  physics: ClampingScrollPhysics(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: FxText.bodyMedium("26, Jun 2020", fontWeight: 600),
              ),
              Container(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: GridView.count(
                  crossAxisCount: 4,
                  padding: const EdgeInsets.all(4.0),
                  shrinkWrap: true,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: _generateGridItems(7),
                  physics: ClampingScrollPhysics(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: FxText.bodyMedium("Older photos", fontWeight: 600),
              ),
              Container(
                margin: EdgeInsets.all(14),
                child: GridView.count(
                  crossAxisCount: 5,
                  padding: const EdgeInsets.all(4.0),
                  shrinkWrap: true,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  children: _generateGridItems(10),
                  physics: ClampingScrollPhysics(),
                ),
              )
            ],
          ),
        ));
  }
}
