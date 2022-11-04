/*
* File : Beveled Card
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class BeveledCard extends StatefulWidget {
  @override
  _BeveledCardState createState() => _BeveledCardState();
}

class _BeveledCardState extends State<BeveledCard> {
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
        body: ListView(
      padding: FxSpacing.all(0),
      children: <Widget>[
        Container(
            padding: FxSpacing.fromLTRB(24, 24, 24, 0),
            child: _OneSidedBeveledCard()),
        Container(
            padding: FxSpacing.fromLTRB(24, 24, 24, 0),
            child: _TwoSidedBeveledCard()),
        Container(padding: FxSpacing.all(24), child: _BeveledCard()),
      ],
    ));
  }
}

class _BeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: FxSpacing.all(0),
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
              padding: EdgeInsets.all(24),
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
                                color: themeData.colorScheme.primary)),
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
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: FxSpacing.all(0),
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
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
              padding: EdgeInsets.all(24),
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
                                color: themeData.colorScheme.primary)),
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
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: FxSpacing.all(0),
      elevation: 4,
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
              image: AssetImage(Images.profileBanner),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: FxSpacing.all(24),
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
                                color: themeData.colorScheme.primary)),
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
