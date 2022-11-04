/*
* File : Fingerprint Lock Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class FingerprintLockBottomSheet extends StatefulWidget {
  @override
  _FingerprintLockBottomSheetState createState() =>
      _FingerprintLockBottomSheetState();
}

class _FingerprintLockBottomSheetState
    extends State<FingerprintLockBottomSheet> {
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
      child: FxButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 0,
          borderRadiusAll: 4,
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
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
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
                          Icon(Icons.fingerprint,
                              color: theme.colorScheme.onBackground, size: 64),
                          Container(
                            margin: EdgeInsets.only(top: 64),
                            child: FxText.bodyMedium(
                                "Touch the fingerprint sensor",
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.2),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
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
