/*
* File : Switch
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    isSelected = [true, false];
  }

  bool _switch = true;

  late List<bool> isSelected;

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
          title: FxText.titleMedium("Switch", fontWeight: 600),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16),
                child: Switch(
                  onChanged: (bool value) {
                    setState(() {
                      _switch = value;
                    });
                  },
                  value: _switch,
                  activeColor: theme.colorScheme.primary,
                )),
            Container(
              margin: EdgeInsets.all(16),
              child: ToggleButtons(
                fillColor: theme.colorScheme.primary,
                color: Colors.transparent,
                borderWidth: 0,
                selectedBorderColor: theme.colorScheme.primary,
                selectedColor: theme.colorScheme.primary,
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(0),
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FxText.bodyLarge(
                        'Open 24 Hours',
                        fontWeight: 600,
                        color: isSelected[0]
                            ? theme.colorScheme.onSecondary
                            : theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FxText.bodyLarge(
                        'Custom Hours',
                        fontWeight: 600,
                        color: isSelected[1]
                            ? theme.colorScheme.onSecondary
                            : theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = (i == index);
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
          ],
        ));
  }
}
