/*
* File : Text Liquid Fill
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/widgets/custom/text_liquid_fill.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TextLiquidFillWidget extends StatefulWidget {
  @override
  _TextLiquidFillWidgetState createState() => _TextLiquidFillWidgetState();
}

class _TextLiquidFillWidgetState extends State<TextLiquidFillWidget> {
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
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(MdiIcons.chevronLeft),
                ),
              ),
              TextLiquidFill(
                  text: "FLUTTER",
                  loadDuration: Duration(seconds: 15),
                  waveDuration: Duration(milliseconds: 600),
                  waveColor: Colors.blue,
                  textStyle: FxTextStyle.displayMedium(
                      fontWeight: 800, letterSpacing: 0.5)),
              TextLiquidFill(
                  text: "UIKIT",
                  loadDuration: Duration(seconds: 15),
                  waveDuration: Duration(milliseconds: 700),
                  waveColor: Colors.red,
                  textStyle: FxTextStyle.displayMedium(
                      fontWeight: 800, letterSpacing: 0.5)),
              TextLiquidFill(
                  text: "LIQUID",
                  loadDuration: Duration(seconds: 15),
                  waveDuration: Duration(milliseconds: 800),
                  waveColor: Colors.green,
                  textStyle: FxTextStyle.displayMedium(
                      fontWeight: 800, letterSpacing: 0.5)),
              TextLiquidFill(
                  text: "EFFECT",
                  loadDuration: Duration(seconds: 15),
                  waveDuration: Duration(milliseconds: 900),
                  waveColor: Colors.yellow,
                  textStyle: FxTextStyle.displayMedium(
                      fontWeight: 800, letterSpacing: 0.5)),
            ],
          ),
        ));
  }
}
