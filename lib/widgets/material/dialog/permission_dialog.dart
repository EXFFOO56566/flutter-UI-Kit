/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class PermissionDialog extends StatefulWidget {
  @override
  _LocationPermissionWidgetState createState() =>
      _LocationPermissionWidgetState();
}

class _LocationPermissionWidgetState extends State<PermissionDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _PermissionDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FxButton(
          elevation: 0,
          borderRadiusAll: 4,
          onPressed: () => _showDialog(),
          child: FxText.bodyMedium("Give Permission",
              color: theme.colorScheme.onPrimary)),
    ));
  }
}

class _PermissionDialog extends StatefulWidget {
  @override
  _PermissionDialogState createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<_PermissionDialog> {
  bool? _check1 = false;

  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: FxSpacing.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: FxSpacing.right(16),
                  child: Icon(
                    Icons.map_outlined,
                    size: 28,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                FxSpacing.width(8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: FxTextStyle.bodyLarge(
                            fontWeight: 500, letterSpacing: 0.2),
                        children: <TextSpan>[
                          TextSpan(text: "Allow "),
                          TextSpan(
                              text: "FlutKit",
                              style: FxTextStyle.bodyLarge(fontWeight: 700)),
                          TextSpan(text: " to access this device's location?"),
                        ]),
                  ),
                )
              ],
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    activeColor: theme.colorScheme.primary,
                    onChanged: (bool? value) {
                      setState(() {
                        _check1 = value;
                      });
                    },
                    value: _check1,
                  ),
                  FxText.titleSmall("Dont's ask again",
                      fontWeight: 500, letterSpacing: 0.2)
                ],
              ),
            ),
            Container(
                margin: FxSpacing.top(8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("DENY",
                            fontWeight: 700, letterSpacing: 0.4)),
                    FxButton(
                        backgroundColor: theme.colorScheme.primary,
                        borderRadiusAll: 4,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("ALLOW",
                            letterSpacing: 0.4,
                            color: theme.colorScheme.onPrimary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
