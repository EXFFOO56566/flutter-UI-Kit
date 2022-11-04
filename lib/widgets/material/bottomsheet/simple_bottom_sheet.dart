/*
* File : Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class SimpleBottomSheet extends StatefulWidget {
  @override
  _SimpleBottomSheetState createState() => _SimpleBottomSheetState();
}

class _SimpleBottomSheetState extends State<SimpleBottomSheet> {
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
        borderRadiusAll: 4,
        elevation: 0,
        child: FxText.titleSmall("Show bottom sheet",
            color: theme.colorScheme.onSecondary),
      ),
    ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Padding(
              padding: FxSpacing.fromLTRB(24, 24, 24, 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.supervisor_account_outlined,
                              size: 26, color: theme.colorScheme.onBackground),
                          Container(
                            margin: FxSpacing.top(4),
                            child: Text(
                              "180 Followers",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.colorScheme.onBackground),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.supervisor_account_outlined,
                              size: 26, color: theme.colorScheme.onBackground),
                          Container(
                            margin: FxSpacing.top(4),
                            child: Text(
                              "147 Following",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: theme.colorScheme.onBackground),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
