/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LocationPermissionDialogWidget extends StatefulWidget {
  @override
  _LocationPermissionWidgetState createState() =>
      _LocationPermissionWidgetState();
}

class _LocationPermissionWidgetState
    extends State<LocationPermissionDialogWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _PermissionDialog());
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
          title: FxText.titleMedium("Permission", fontWeight: 600),
        ),
        body: Center(
          child: FxButton(
              elevation: 2,
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
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: new BoxDecoration(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    MdiIcons.mapMarkerOutline,
                    size: 28,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
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
              margin: EdgeInsets.only(top: 16),
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
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("DENY",
                            fontWeight: 600,
                            color: theme.colorScheme.primary,
                            letterSpacing: 0.4)),
                    FxButton(
                        elevation: 2,
                        borderRadiusAll: 4,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.bodyMedium("ALLOW",
                            fontWeight: 600,
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
