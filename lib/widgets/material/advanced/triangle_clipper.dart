/*
* File : Triangle Clipper
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class TriangleClipper extends StatefulWidget {
  @override
  _TriangleClipperState createState() => _TriangleClipperState();
}

class _TriangleClipperState extends State<TriangleClipper> {
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
          title: FxText.titleMedium("Triangle Clipper", fontWeight: 600),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: theme.colorScheme.primary,
          child: Stack(
            children: <Widget>[
              ClipPath(
                  clipper: _Clipper(),
                  child: Container(
                    alignment: Alignment.center,
                    color: theme.backgroundColor,
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: FxText.titleMedium("Out Clipper",
                        color: theme.colorScheme.onBackground)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: FxText.titleMedium("On Clipper",
                        color: theme.colorScheme.onPrimary)),
              ),
            ],
          ),
        ));
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
