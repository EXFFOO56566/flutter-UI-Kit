/*
* File : Perspective Transform
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PerspectiveTransformWidget extends StatefulWidget {
  @override
  _PerspectiveTransformWidgetState createState() =>
      _PerspectiveTransformWidgetState();
}

class _PerspectiveTransformWidgetState
    extends State<PerspectiveTransformWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    return Transform(
        // Transform widget
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * _offset.dy) // changed
          ..rotateY(-0.01 * _offset.dx), // changed
        alignment: FractionalOffset.center,
        child: GestureDetector(
          // new
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  FeatherIcons.chevronLeft,
                  size: 20,
                ),
              ),
              title: FxText.titleLarge('Perspective Transform',
                  fontWeight: 600), // changed
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxText.titleSmall(
                    'Swipe your finger to screen',
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Back Button',
              child: Icon(MdiIcons.chevronLeft),
            ),
          ),
        ));
  }
}
