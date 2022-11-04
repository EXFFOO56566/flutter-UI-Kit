/*
* File : Account Choose Bottom Sheet 
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountBottomSheetWidget extends StatefulWidget {
  @override
  _AccountBottomSheetWidgetState createState() =>
      _AccountBottomSheetWidgetState();
}

class _AccountBottomSheetWidgetState extends State<AccountBottomSheetWidget> {
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
          title: FxText.titleMedium("Account", fontWeight: 600),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                color: theme.appBarTheme.backgroundColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.informationOutline,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: FxText.titleSmall(
                          "Tap on account image",
                        )),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.all(20),
                child: FxContainer(
                  borderRadiusAll: 4,
                  padding:
                      EdgeInsets.only(left: 12, top: 6, right: 12, bottom: 6),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Container(
                            child: FxTextField(
                              autofocus: false,
                              decoration: InputDecoration(
                                  hintText: "Search here",
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
                            image: new DecorationImage(
                                image: AssetImage(
                                    "./assets/images/profile/avatar_2.jpg"),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ],
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
              decoration: new BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  image: AssetImage(
                                      './assets/images/profile/avatar_2.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
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
                                        MdiIcons.chevronDown,
                                        size: 16,
                                        color: theme.colorScheme.onBackground,
                                      )
                                    ],
                                  ),
                                ],
                              ),
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
                      leading: Icon(MdiIcons.bellRingOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Activity",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.cogOutline,
                          color: theme.colorScheme.onBackground.withAlpha(220)),
                      title: FxText.bodyLarge("Settings",
                          color: theme.colorScheme.onBackground,
                          letterSpacing: 0.3,
                          fontWeight: 500),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.helpCircleOutline,
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
