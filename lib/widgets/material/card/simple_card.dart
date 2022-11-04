/*
* File : Simple Card 
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class SimpleCardScreen extends StatefulWidget {
  @override
  _SimpleCardScreenState createState() => _SimpleCardScreenState();
}

class _SimpleCardScreenState extends State<SimpleCardScreen> {
  double _elevation = 2;

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
            child: ListView(
      padding: FxSpacing.all(0),
      children: <Widget>[
        Container(
          margin: FxSpacing.fromLTRB(16, 12, 16, 0),
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
                      _elevation = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          margin: FxSpacing.fromLTRB(16, 12, 16, 0),
          child: _SimpleCard(
            elevation: _elevation,
          ),
        ),
        Container(
            margin: FxSpacing.all(16),
            child: _CircularCard(
              elevation: _elevation,
            )),
      ],
    )));
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
            image: AssetImage(Images.profileBanner),
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: FxSpacing.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.titleMedium("Title", fontWeight: 600),
                    FxText.bodyMedium(
                        "Lorem ipsum, or lipsum as it is sometimes known",
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
              image: AssetImage(Images.profileBanner),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: FxSpacing.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleMedium("Title", fontWeight: 600),
                      FxText.bodyMedium(
                          "Lorem ipsum, or lipsum as it is sometimes known",
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
