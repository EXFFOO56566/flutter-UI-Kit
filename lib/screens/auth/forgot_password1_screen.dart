/*
* File : Forgot Password
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ForgotPassword1Screen extends StatefulWidget {
  @override
  _ForgotPassword1ScreenState createState() => _ForgotPassword1ScreenState();
}

class _ForgotPassword1ScreenState extends State<ForgotPassword1Screen> {
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
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 3 / 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(48))),
              ),
              Positioned(
                top: FxSpacing.safeAreaTop(context) + 12,
                left: 16,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FxText.headlineSmall("FORGOT PASSWORD", fontWeight: 600),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: FxContainer.bordered(
              margin: FxSpacing.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: FxTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: FxTextStyle.titleSmall(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      prefixIcon: Icon(MdiIcons.emailOutline),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: FxButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        child: FxText.labelMedium("RESET PASSWORD",
                            fontWeight: 600,
                            color: theme.colorScheme.onPrimary,
                            letterSpacing: 0.5)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
