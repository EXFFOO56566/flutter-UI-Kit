/*
* File : Bottom Sheet
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
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
          title: FxText.titleMedium("Bottom Sheet", fontWeight: 600),
        ),
        body: Center(
          child: FxButton(
              borderRadiusAll: 4,
              onPressed: () {
                _showBottomSheet(context);
              },
              child: FxText.titleSmall("Show bottom sheet",
                  color: theme.colorScheme.onSecondary)),
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
              padding:
                  EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(MdiIcons.accountMultiple,
                              size: 26, color: theme.colorScheme.onBackground),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: FxText(
                              "180 Followers",
                              color: theme.colorScheme.onBackground,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(MdiIcons.accountGroup,
                              size: 26, color: theme.colorScheme.onBackground),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: FxText("147 Following",
                                textAlign: TextAlign.center,
                                color: theme.colorScheme.onBackground),
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
