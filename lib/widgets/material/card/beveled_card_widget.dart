/*
* File : Beveled Card
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class BeveledCardWidget extends StatefulWidget {
  @override
  _BeveledCardWidgetState createState() => _BeveledCardWidgetState();
}

class _BeveledCardWidgetState extends State<BeveledCardWidget> {
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
          title: FxText.titleMedium("Beveled Card", fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: _OneSidedBeveledCard()),
            Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: _TwoSidedBeveledCard()),
            Container(padding: EdgeInsets.all(16), child: _BeveledCard()),
          ],
        ));
  }
}

class _BeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/apps/hotel/room-1.jpg"),
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
                      FxText.titleMedium("Beveled", fontWeight: 600),
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

class _OneSidedBeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/apps/hotel/room-2.jpg"),
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
                      FxText.titleMedium("One Sided", fontWeight: 600),
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

class _TwoSidedBeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                      FxText.titleMedium("Two Sided", fontWeight: 600),
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
