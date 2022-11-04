/*
* File : Snack Bars
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SnackbarWidget extends StatefulWidget {
  @override
  _Widget createState() => _Widget();
}

class _Widget extends State<SnackbarWidget>
    with SingleTickerProviderStateMixin {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = Tween<double>(begin: 0, end: 3).animate(controller);
  }

  Animation<double>? animation;
  late AnimationController controller;

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
          title: FxText.titleMedium("Snack Bars", fontWeight: 600),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: theme.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      showSimpleSnackbar();
                    },
                    child: FxText.bodyMedium("Simple snack bar",
                        color: theme.colorScheme.onSecondary)),
                FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      showSnackbarWithAction();
                    },
                    child: FxText.bodyMedium("Snack bar with actions",
                        color: theme.colorScheme.onSecondary)),
                FxButton(
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      showSnackbarWithFloating();
                    },
                    child: FxText.bodyMedium("Floating snackbar",
                        color: theme.colorScheme.onSecondary)),
                FxButton(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    showSnackbarWithFloatingAction();
                  },
                  child: FxText.bodyMedium("Floating snackbar with action",
                      color: theme.colorScheme.onSecondary),
                )
              ],
            ),
          ),
        ));
  }

  void showSimpleSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall("This is simple snack bar",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }

  void showSnackbarWithAction() {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
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

  void showSnackbarWithFloating() {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall("Message has been deleted",
            color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSnackbarWithFloatingAction() {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
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
