/*
* File : Gallery Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GalleryBottomSheetWidget extends StatefulWidget {
  @override
  _GalleryBottomSheetWidgetState createState() =>
      _GalleryBottomSheetWidgetState();
}

class _GalleryBottomSheetWidgetState extends State<GalleryBottomSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
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
  ];

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Container(
          child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
        ),
      ));
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
          title: FxText.titleMedium("Gallery", fontWeight: 600),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: theme.appBarTheme.backgroundColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.informationOutline,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: FxText.titleSmall(
                        "Tap on any image",
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(16),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: _generateGridItems()),
                ),
              )
            ],
          ),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.eyeOutline,
                          color: theme.colorScheme.onBackground),
                      title: FxText.bodyLarge("Preview", fontWeight: 600),
                    ),
                    ListTile(
                        dense: true,
                        leading: Icon(MdiIcons.shareOutline,
                            color: theme.colorScheme.onBackground),
                        title: FxText.bodyLarge("Share", fontWeight: 600)),
                    ListTile(
                        dense: true,
                        leading: Icon(MdiIcons.downloadOutline,
                            color: theme.colorScheme.onBackground),
                        title: FxText.bodyLarge("Download", fontWeight: 600)),
                    ListTile(
                        dense: true,
                        leading: Icon(MdiIcons.contentCopy,
                            color: theme.colorScheme.onBackground),
                        title:
                            FxText.bodyLarge("Make a copy", fontWeight: 600)),
                    ListTile(
                        dense: true,
                        leading: Icon(
                          MdiIcons.deleteOutline,
                          color: theme.colorScheme.onBackground,
                        ),
                        title: FxText.bodyLarge("Delete", fontWeight: 600)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
