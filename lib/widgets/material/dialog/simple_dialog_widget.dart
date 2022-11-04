/*
* File : Simple Dialog
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SimpleDialogWidget extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleDialogWidget> {
  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _SimpleDialog());
  }

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());

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
          title: FxText.titleMedium("Simple Dialog", fontWeight: 600),
        ),
        body: Center(
          child: FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {
                _showDialog();
              },
              child: FxText.bodyMedium("Simple Dialog",
                  fontWeight: 600,
                  color: theme.colorScheme.onPrimary,
                  letterSpacing: 0.2)),
        ));
  }
}

class _SimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FxText.titleLarge(
              "Title",
              fontWeight: 700,
            ),
            FxText.titleMedium(
              "Description...",
              fontWeight: 500,
            ),
            Container(
                alignment: AlignmentDirectional.centerEnd,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: FxText.bodyMedium("OK",
                        letterSpacing: 0.3,
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary))),
          ],
        ),
      ),
    );
  }
}
