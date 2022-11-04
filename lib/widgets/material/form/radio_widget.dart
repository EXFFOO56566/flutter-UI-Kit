/*
* File : Radio
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? _radioValue = 1;

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
          title: FxText.titleMedium("Radio Button", fontWeight: 600),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: FxText.titleSmall("Radio 1", fontWeight: 600),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  leading: Radio(
                    value: 1,
                    activeColor: theme.colorScheme.primary,
                    groupValue: _radioValue,
                    onChanged: (int? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: FxText.titleSmall("Radio 2", fontWeight: 600),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  leading: Radio(
                    value: 2,
                    activeColor: theme.colorScheme.primary,
                    groupValue: _radioValue,
                    onChanged: (int? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: FxText.titleSmall("Radio 3", fontWeight: 600),
                  contentPadding: EdgeInsets.all(0),
                  dense: true,
                  leading: Radio(
                    value: 3,
                    activeColor: theme.colorScheme.primary,
                    groupValue: _radioValue,
                    onChanged: (int? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
