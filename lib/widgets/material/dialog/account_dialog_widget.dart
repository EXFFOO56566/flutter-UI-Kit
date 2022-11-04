/*
* File : Account Dialog 
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountDialogWidget extends StatefulWidget {
  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountDialogWidget> {
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
        context: context, builder: (BuildContext context) => _AccountDialog());
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
          title: FxText.titleMedium("Account Dialog", fontWeight: 600),
        ),
        body: Center(
          child: FxButton(
              elevation: 0,
              borderRadiusAll: 4,
              onPressed: () {
                _showDialog();
              },
              child: FxText.titleSmall("Account Dialog",
                  color: theme.colorScheme.onPrimary, letterSpacing: 0.2)),
        ));
  }
}

class _AccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = AppTheme.theme;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Aishah Mcconnell", fontWeight: 700),
                      FxText.bodyMedium("ais@mcc.com", fontWeight: 500),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 12),
                        child: FxButton(
                            onPressed: () {},
                            elevation: 0,
                            borderRadiusAll: 4,
                            child: FxText.bodyMedium(
                              "Manage all accounts",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_1.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Liana Fitzgeraldl", fontWeight: 700),
                      FxText.bodyMedium("liana.fits@gmail.com",
                          fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/profile/avatar.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Sally Lee", fontWeight: 700),
                      FxText.bodyMedium("sallylee@qq.com", fontWeight: 500),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.titleSmall("Shamima Ballard", fontWeight: 700),
                      FxText.bodyMedium(
                        "ballard@gmail.com",
                        fontWeight: 500,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: Icon(
                      MdiIcons.accountPlusOutline,
                      color: theme.colorScheme.onBackground,
                      size: 22,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: FxText.titleSmall("Add another account",
                      fontWeight: 700, letterSpacing: 0),
                ),
              ],
            ),
          ),
          Divider(
            color: theme.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            alignment: AlignmentDirectional.center,
            child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      MdiIcons.logoutVariant,
                      size: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FxText.bodyMedium("Sign out from all account",
                          fontWeight: 600),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
