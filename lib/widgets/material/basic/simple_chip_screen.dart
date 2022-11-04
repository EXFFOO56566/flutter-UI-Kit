/*
* File : Simple Chip 
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class SimpleChipScreen extends StatefulWidget {
  @override
  _SimpleChipScreenState createState() => _SimpleChipScreenState();
}

class _SimpleChipScreenState extends State<SimpleChipScreen> {
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
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Chip(
            backgroundColor: customTheme.card,
            label: FxText.titleMedium('Simple',
                color: theme.colorScheme.onBackground),
          ),
          FxSpacing.height(4),
          Chip(
            backgroundColor: customTheme.card,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child:
                  FxText.titleMedium('L', color: theme.colorScheme.onSecondary),
            ),
            label: FxText.titleMedium('Leading',
                color: theme.colorScheme.onBackground),
          ),
          FxSpacing.height(4),
          Chip(
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: FxText.titleMedium(
              'Trailing',
              color: theme.colorScheme.onBackground,
            ),
          ),
          FxSpacing.height(4),
          Chip(
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child:
                  FxText.titleMedium('S', color: theme.colorScheme.onPrimary),
            ),
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: FxText.titleMedium('Small',
                color: theme.colorScheme.onBackground),
          ),
          FxSpacing.height(4),
          Chip(
            padding: EdgeInsets.all(8),
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: FxText.titleSmall(
                'M',
                color: theme.colorScheme.onPrimary,
              ),
            ),
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: FxText.titleMedium('Medium',
                color: theme.colorScheme.onBackground),
          ),
          FxSpacing.height(4),
          Chip(
            padding: EdgeInsets.all(8),
            deleteIcon: Icon(Icons.delete),
            backgroundColor: customTheme.card,
            deleteIconColor: theme.colorScheme.secondary,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: FxText.titleMedium('Custom Icon',
                color: theme.colorScheme.onBackground),
          ),
          FxSpacing.height(4),
          Chip(
            deleteButtonTooltipMessage: "Custom Message",
            padding: EdgeInsets.all(8),
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: FxText.titleSmall('H', color: theme.colorScheme.onPrimary),
            ),
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: FxText.titleMedium('Hold Delete',
                color: theme.colorScheme.onBackground),
          ),
          FxSpacing.height(4),
          Chip(
            padding: EdgeInsets.all(8),
            elevation: 10,
            avatar: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              child: FxText.titleSmall('E', color: theme.colorScheme.onPrimary),
            ),
            deleteIconColor: theme.colorScheme.secondary,
            backgroundColor: customTheme.card,
            onDeleted: () {
              showSimpleSnackBar("Delete pressed");
            },
            label: FxText.titleMedium('Elevated',
                color: theme.colorScheme.onBackground),
          ),
        ],
      ),
    ));
  }

  void showSimpleSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
