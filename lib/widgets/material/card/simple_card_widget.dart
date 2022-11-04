/*
* File : Simple Card 
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SimpleCardWidget extends StatefulWidget {
  @override
  _SimpleCardWidgetState createState() => _SimpleCardWidgetState();
}

class _SimpleCardWidgetState extends State<SimpleCardWidget> {
  double _elevation = 2;

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
          title: FxText.titleMedium("Simple Card", fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Row(
                children: <Widget>[
                  FxText.bodyLarge("Elevation", fontWeight: 600),
                  Slider(
                    value: _elevation,
                    min: 0,
                    max: 10,
                    label: _elevation.toStringAsFixed(1),
                    onChanged: (value) {
                      setState(
                        () {
                          print(value);
                          _elevation = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: _SimpleCard(
                elevation: _elevation,
              ),
            ),
            Container(
                margin: EdgeInsets.all(16),
                child: _CircularCard(
                  elevation: _elevation,
                )),
          ],
        ));
  }
}

class _SimpleCard extends StatefulWidget {
  final double elevation;

  const _SimpleCard({Key? key, this.elevation = 1}) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      elevation: widget.elevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage("./assets/images/apps/hotel/room-2.jpg"),
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium("Title", fontWeight: 600),
                    FxText.bodyMedium(
                        "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                        height: 1.2,
                        fontWeight: 500),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: FxText.labelMedium("ACTION",
                              fontWeight: 600,
                              color: theme.colorScheme.primary)),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CircularCard extends StatefulWidget {
  final double elevation;

  const _CircularCard({Key? key, this.elevation = 1}) : super(key: key);

  @override
  _CircularCardState createState() => _CircularCardState();
}

class _CircularCardState extends State<_CircularCard> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      elevation: widget.elevation,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/apps/hotel/room-3.jpg"),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleMedium("Title", fontWeight: 600),
                      FxText.bodyMedium(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                          height: 1.2,
                          fontWeight: 500),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: FxText.labelMedium("ACTION",
                                fontWeight: 600,
                                color: theme.colorScheme.primary)),
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
