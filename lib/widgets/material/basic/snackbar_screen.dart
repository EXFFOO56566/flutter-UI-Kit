/*
* File : Snack Bars
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class SnackBarScreen extends StatefulWidget {
  @override
  _Widget createState() => _Widget();
}

class _Widget extends State<SnackBarScreen>
    with SingleTickerProviderStateMixin {
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
        body: Padding(
      padding: FxSpacing.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FxButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSimpleSnackbar();
                },
                child: FxText.bodyMedium("Simple snack bar",
                    color: theme.colorScheme.onPrimary)),
            FxButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSnackBarWithAction();
                },
                child: FxText.bodyMedium("Snack bar with actions",
                    color: theme.colorScheme.onPrimary)),
            FxButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSnackBarWithFloating();
                },
                child: FxText.bodyMedium("Floating snackbar",
                    color: theme.colorScheme.onPrimary)),
            FxButton(
                elevation: 0,
                borderRadiusAll: 4,
                onPressed: () {
                  showSnackBarWithFloatingAction();
                },
                child: FxText.bodyMedium("Floating snackbar with action",
                    color: theme.colorScheme.onPrimary)),
          ],
        ),
      ),
    ));
  }

  void showSimpleSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "This is simple snack bar",
          style: theme.textTheme.subtitle2!
              .merge(TextStyle(color: theme.colorScheme.onPrimary)),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }

  void showSnackBarWithAction() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        action: SnackBarAction(
          onPressed: () {},
          label: "Undo",
          textColor: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }

  void showSnackBarWithFloating() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSnackBarWithFloatingAction() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        action: SnackBarAction(
          onPressed: () {},
          label: "Undo",
          textColor: theme.colorScheme.onPrimary,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
