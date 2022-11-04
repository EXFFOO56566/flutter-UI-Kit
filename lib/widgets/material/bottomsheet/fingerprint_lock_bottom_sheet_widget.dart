/*
* File : Fingerprint Lock Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FingerprintLockBottomSheetWidget extends StatefulWidget {
  @override
  _FingerprintLockBottomSheetWidgetState createState() =>
      _FingerprintLockBottomSheetWidgetState();
}

class _FingerprintLockBottomSheetWidgetState
    extends State<FingerprintLockBottomSheetWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
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
          title: FxText.titleMedium("Login", fontWeight: 600),
        ),
        body: Center(
          child: FxButton(
              borderRadiusAll: 4,
              elevation: 2,
              onPressed: () {
                _showBottomSheet(context);
              },
              child: FxText.bodyMedium("Login with Fingerprint",
                  color: theme.colorScheme.onPrimary)),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: FxText.titleMedium("Sign In",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        children: <Widget>[
                          Icon(MdiIcons.fingerprint,
                              color: theme.colorScheme.onBackground, size: 64),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: FxText.bodyMedium(
                                "Touch the fingerprint sensor",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.2),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: FxText.bodyMedium("CANCEL",
                              color: theme.colorScheme.secondary,
                              fontWeight: 600,
                              letterSpacing: 0.4)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
