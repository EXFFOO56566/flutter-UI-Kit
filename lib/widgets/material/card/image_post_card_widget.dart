/*
* File : Image Post Card
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImagePostCardWidget extends StatefulWidget {
  @override
  _ImagePostCardWidgetState createState() => _ImagePostCardWidgetState();
}

class _ImagePostCardWidgetState extends State<ImagePostCardWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  double _elevation = 3;

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
          title: FxText.titleMedium("Post", fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: FxText.bodyLarge("Recent Post", fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: _SimpleCard(
                elevation: _elevation,
                image: './assets/images/all/all-l3.jpg',
                title: 'At Mountain',
                description:
                    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
                like: 254,
                height: 220,
                view: 563,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: FxText.bodyLarge("Old Posts", fontWeight: 700),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      child: _SimpleCard(
                        elevation: _elevation,
                        image: './assets/images/all/all-l2.jpg',
                        title: 'Ice',
                        description:
                            'Lorem ipsum, or lipsum as it is sometimes known',
                        like: 158,
                        view: 353,
                        height: 150,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: _SimpleCard(
                        elevation: _elevation,
                        image: './assets/images/all/all-p3.jpg',
                        title: 'With Nature',
                        height: 150,
                        description:
                            'Lorem ipsum, or lipsum as it is sometimes known',
                        like: 215,
                        view: 314,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _SimpleCard extends StatefulWidget {
  final double elevation;
  final String? image, title, description;
  final int? like, view, height;

  const _SimpleCard(
      {Key? key,
      this.elevation = 1,
      this.image,
      this.title,
      this.description,
      this.like,
      this.view,
      this.height})
      : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: widget.elevation,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(widget.image!),
              height: widget.height!.toDouble(),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleMedium(widget.title!, fontWeight: 600),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: FxText.bodyMedium(widget.description!,
                            fontWeight: 500, height: 1.2),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.heart,
                              color: theme.colorScheme.secondary,
                              size: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: FxText.bodySmall(widget.like.toString(),
                                  fontWeight: 600),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Icon(
                                  MdiIcons.eye,
                                  color: theme.colorScheme.onBackground,
                                  size: 20,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: FxText.bodySmall(widget.view.toString(),
                                  fontWeight: 600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
