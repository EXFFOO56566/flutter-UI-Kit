/*
* File : Simple Chip 
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SimpleChipWidget extends StatefulWidget {
  @override
  _SimpleChipWidgetState createState() => _SimpleChipWidgetState();
}

class _SimpleChipWidgetState extends State<SimpleChipWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

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
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.titleMedium("Simple Chip", fontWeight: 600),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            color: theme.backgroundColor,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Chip(
                    backgroundColor: theme.colorScheme.background,
                    label: FxText.titleMedium('Simple',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    backgroundColor: theme.colorScheme.background,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: FxText.titleMedium('L',
                          color: theme.colorScheme.onSecondary),
                    ),
                    label: FxText.titleMedium('Leading',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: FxText.titleMedium('Trailing',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: FxText.titleMedium('S',
                          color: theme.colorScheme.onPrimary),
                    ),
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: FxText.titleMedium('Small',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    padding: EdgeInsets.all(8),
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: FxText.titleSmall('M',
                          color: theme.colorScheme.onPrimary),
                    ),
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: FxText.titleMedium('Medium',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    padding: EdgeInsets.all(8),
                    deleteIcon: Icon(MdiIcons.delete),
                    backgroundColor: theme.colorScheme.background,
                    deleteIconColor: theme.colorScheme.secondary,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: FxText.titleMedium('Custom Icon',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    deleteButtonTooltipMessage: "Custom Message",
                    padding: EdgeInsets.all(8),
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: FxText.titleSmall('H',
                          color: theme.colorScheme.onPrimary),
                    ),
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: FxText.titleMedium('Hold Delete',
                        color: theme.colorScheme.onBackground),
                  ),
                  Chip(
                    padding: EdgeInsets.all(8),
                    elevation: 10,
                    avatar: CircleAvatar(
                      backgroundColor: theme.colorScheme.primary,
                      child: FxText.titleSmall('E',
                          color: theme.colorScheme.onPrimary),
                    ),
                    deleteIconColor: theme.colorScheme.secondary,
                    backgroundColor: theme.colorScheme.background,
                    onDeleted: () {
                      showSimpleSnackbar("Delete pressed");
                    },
                    label: FxText.titleMedium('Elevated',
                        color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            )));
  }

  void showSimpleSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
      ),
    );
  }
}
