/*
* File : Cupertino Picker
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class CupertinoPickerWidget extends StatefulWidget {
  @override
  _CupertinoPickerWidgetState createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int? selectedValue;

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: CupertinoPicker(
              backgroundColor: theme.backgroundColor,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemExtent: 40.0,
              children: [
                FxText('Item - 1', color: theme.colorScheme.onBackground),
                FxText('Item - 2', color: theme.colorScheme.onBackground),
                FxText('Item - 3', color: theme.colorScheme.onBackground),
                FxText('Item - 4', color: theme.colorScheme.onBackground),
                FxText('Item - 5', color: theme.colorScheme.onBackground),
                FxText('Item - 6', color: theme.colorScheme.onBackground),
              ],
            ),
          );
        });
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
          title: FxText.titleMedium("Cupertino Picker", fontWeight: 600),
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Center(
              child: CupertinoButton(
                  color: theme.colorScheme.primary,
                  onPressed: () {
                    showPicker();
                  },
                  padding:
                      EdgeInsets.only(left: 32, top: 8, right: 32, bottom: 8),
                  pressedOpacity: 0.5,
                  child: FxText.bodyMedium("Pick",
                      color: theme.colorScheme.onSecondary)),
            )));
  }
}
