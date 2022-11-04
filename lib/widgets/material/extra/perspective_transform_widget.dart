/*
* File : Perspective Transform
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class PerspectiveTransformWidget extends StatefulWidget {
  @override
  _PerspectiveTransformWidgetState createState() =>
      _PerspectiveTransformWidgetState();
}

class _PerspectiveTransformWidgetState
    extends State<PerspectiveTransformWidget> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Transform(
            // Transform widget
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(0.01 * _offset.dy) // changed
              ..rotateY(-0.01 * _offset.dx), // changed
            alignment: FractionalOffset.center,
            child: GestureDetector(
              // new
              onPanUpdate: (details) =>
                  setState(() => _offset += details.delta),
              onDoubleTap: () => setState(() => _offset = Offset.zero),
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(FeatherIcons.chevronLeft),
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
                  child: Icon(FeatherIcons.chevronLeft),
                ),
              ),
            )));
  }
}
