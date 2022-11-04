/*
* File : Full Screen Dialog
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FullScreenDialogWidget extends StatefulWidget {
  @override
  _FullScreenDialogWidgetState createState() => _FullScreenDialogWidgetState();
}

class _FullScreenDialogWidgetState extends State<FullScreenDialogWidget> {
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
          title: FxText.titleMedium("Full Screen", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return FullDialog();
                },
                fullscreenDialog: true));
          },
          child: Icon(Icons.add),
          elevation: 2,
        ),
        body: Center(
          child: FxText.titleMedium("Tap on + to add new task",
              color: theme.colorScheme.onBackground),
        ));
  }
}

class FullDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FxText.titleLarge('Add Task', fontWeight: 600),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Material(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(MdiIcons.check))),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Task",
                hintText: "Type a task",
                border: theme.inputDecorationTheme.border,
                enabledBorder: theme.inputDecorationTheme.border,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
                prefixIcon: Icon(MdiIcons.notePlusOutline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
