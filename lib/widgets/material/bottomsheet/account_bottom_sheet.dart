/*
* File : Account Choose Bottom Sheet 
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

class AccountBottomSheet extends StatefulWidget {
  @override
  _AccountBottomSheetState createState() => _AccountBottomSheetState();
}

class _AccountBottomSheetState extends State<AccountBottomSheet> {
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
        body: Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: FxSpacing.all(16),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: FxSpacing.xy(12, 6),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: FxSpacing.right(8),
                        child: Container(
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: "Tap on account image",
                                hintStyle: FxTextStyle.bodyMedium(),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                isDense: true),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Images.profile1),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
                padding: FxSpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: FxSpacing.fromLTRB(8, 8, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Images.profile1),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          FxSpacing.width(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FxText.titleMedium("Bianka Armitage",
                                    color: theme.colorScheme.onBackground,
                                    letterSpacing: 0.3,
                                    fontWeight: 600),
                                Row(
                                  children: <Widget>[
                                    FxText.bodyMedium("Bian@gmail.com",
                                        color: theme.colorScheme.onBackground,
                                        letterSpacing: 0.3),
                                    Icon(
                                      FeatherIcons.chevronDown,
                                      size: 16,
                                      color: theme.colorScheme.onBackground,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: theme.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.doorbell_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Activity",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.settings_outlined,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Settings",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.help_outline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Help \& Feedback",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
