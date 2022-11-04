/*
* File : Cupertino Picker
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class CupertinoPickerScreen extends StatefulWidget {
  @override
  _CupertinoPickerScreenState createState() => _CupertinoPickerScreenState();
}

class _CupertinoPickerScreenState extends State<CupertinoPickerScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
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
                children: List.generate(10, (index) => index + 1)
                    .map(
                      (element) => Text(
                        'Item - ' + element.toString(),
                        style: TextStyle(color: theme.colorScheme.onBackground),
                      ),
                    )
                    .toList()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CupertinoButton(
          color: theme.colorScheme.primary,
          onPressed: () {
            showPicker();
          },
          padding: FxSpacing.xy(32, 8),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          pressedOpacity: 0.5,
          child: Text(
            "Pick",
            style: theme.textTheme.bodyText2!
                .merge(TextStyle(color: theme.colorScheme.onSecondary)),
          )),
    ));
  }
}
